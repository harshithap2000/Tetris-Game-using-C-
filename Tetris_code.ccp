#include <iostream>
#include <conio.h>
#include <iomanip>
#include <vector>
#include <random>
#include<fstream>
class game
{
    public:

int menu();
int gameOver();
void title();
void gameLoop();
void scoreboard();
void scoreboardin();
void display();
bool makeBlocks();
void initGame();
void moveBlock(int, int);
void collidable();
bool isCollide(int, int);
void userInput();
bool rotateBolck();
void spwanBlock();
};
struct Random
{
    Random(int min, int max)
        : mUniformDistribution(min, max)
    {}

    int operator()()
    {
        return mUniformDistribution(mEngine);
    }

    std::default_random_engine mEngine{ std::random_device()() };
    std::uniform_int_distribution<int> mUniformDistribution;
};
//block initialisation
std::vector<std::vector<int>> stage(22, std::vector<int>(13, 0));
std::vector<std::vector<int>> block =
{
    { 0, 0, 0, 0 },
    { 0, 0, 0, 0 },
    { 0, 0, 0, 0 },
    { 0, 0, 0, 0 }
};

std::vector<std::vector<int>> field(22, std::vector<int>(13, 0));
// coordinate

int y = 0;
int x = 4;
int score=0;
char player_name[200];
bool gameover = false;
size_t GAMESPEED = 20000;

//random pick
Random getRandom{ 0, 6 };

//list of blocks
std::vector<std::vector<std::vector<int>>> block_list =
{
    {
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 }
    },
    {
        { 0, 0, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 }
    },
    {
        { 0, 0, 1, 0 },
        { 0, 1, 1, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 }
    },
    {
        { 0, 1, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 0, 1, 0 },
        { 0, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 0 },
        { 0, 1, 0, 0 },
        { 1, 1, 1, 0 },
        { 0, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 1, 1, 0 },
        { 0, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 0, 1, 0 },
        { 0, 0, 1, 0 }
    }
};


int main()
{
    game obj;
    char ch;
    do{
        switch (obj.menu())
        {
        case 1:
            obj.gameLoop();
            break;
        case 2:
            obj.scoreboard();
        case 3:
            return 0;
        case 0:
            std::cerr << "Choose 1~2" << std::endl;
            return -1;
        }
    std::cout<<"replay[y/n]:";
    std::cin>>ch;
    }
    while(ch=='y' ||ch=='Y');
    return 0;
}

int game:: gameOver()
{
    using namespace std;

    char a;
    cout<<"\n\n\n\n";
    
    cout << " #####     #    #     # ####### ####### #     # ####### ######\n" ;
    cout << "#     #   # #   ##   ## #       #     # #     # #       #     #\n";
    cout << "#        #   #  # # # # #       #     # #     # #       #     #\n";
    cout << "#  #### #     # #  #  # #####   #     # #     # #####   ######\n";
    cout << "#     # ####### #     # #       #     #  #   #  #       #   #\n";
    cout << "#     # #     # #     # #       #     #   # #   #       #    #\n";
    cout << " #####  #     # #     # ####### #######    #    ####### #     #\n\n\n\n";
    cout<<"Your Score = "<<score<<"\n";
    scoreboardin();
    cout << "\n\nPress any key and enter\n";
    cin >> a;
    return 0;
}

void game:: gameLoop()
{
    size_t time = 0;
    initGame();

    while (!gameover)
    {
        if (kbhit())
        {
            userInput();
        }

        if (time < GAMESPEED)
        {
            time++;
        }
        else
        {
            spwanBlock();
            time = 0;
        }
    }

}
void game:: scoreboard()
{
    using namespace std;

    ofstream out("PlayerName.txt",ios::out); // output, normal file
        if(!out)
        {
        cout << "Cannot open PlayerName.txt file.\n";
        }
        out << player_name <<"  " ;
        cout<<player_name<<" ";
    ofstream out1("Score.txt",ios::out); // output, normal file
            if(!out1)
            {
            cout << "Cannot open Score.txt file.\n";
            }
            out1 << score<< endl;
            cout<<score;
            out.close();
            out1.close();
}
void game:: scoreboardin()
{
    using namespace std;
        ifstream in("PlayerName.txt",ios::app);
         ifstream in1("Score.txt",ios::app);
          if(!in)
        {
        cout << "Cannot open PlayerName.txt file.\n";
        } // input
         if(!in1)
            {
            cout << "Cannot open Score.txt file.\n";
            }
         while(in && in1){
        in.getline(player_name,sizeof(player_name));
        //cout << player_name << "\n";
        in1>>score;
            //cout << score << "\n";
         }
            in.close();
            in1.close();
}

int game:: menu()
{
    title();

    int select_num=0 ;

    std::cin >> select_num;

    switch (select_num)
    {
    case 1:
    case 2:
    case 3:
    case 4:
        break;
    default:
        select_num =0;
        break;
    }

    return select_num;
}

void game::title()
{
    using namespace std;

    system("cls");

    cout << "#==============================================================================#\n";

    cout << "####### ####### ####### ######    ###    #####\n";
    cout << "   #    #          #    #     #    #    #     #\n";
    cout << "   #    #          #    #     #    #    #\n";
    cout << "   #    #####      #    ######     #     #####\n";
    cout << "   #    #          #    #   #      #          #\n";
    cout << "   #    #          #    #    #     #    #     #\n";
    cout << "   #    #######    #    #     #   ###    #####\t\tmade for fun \n";
    cout << "\n\n\n\n";

    cout << "\t<Menu>\n";
    cout << "\t1: Start Game\n \t2:Score Board\n \t3: Quit\n\n";

    cout << "#==============================================================================#\n";
 std::cout<<"Player Name >>";
    std::cin>>player_name;

    cout << "Choose >> ";
}

void game:: display()
{
    system("cls");

    for (size_t i = 0; i < 21; i++)
    {
        for (size_t j = 0; j < 12; j++)
        {
            switch (field[i][j])
            {
            case 0:
                std::cout << " " << std::flush;
                break;
            case 9:
                std::cout << "@" << std::flush;
                break;
            default:
                std::cout << "#" << std::flush;
                break;
            }
        }
        std::cout << std::endl;
    }

    std::cout << "\n\tA: left\tS: down\tD: right \t Rotation[Space]";

    if (gameover)
    {
        system("cls");
        gameOver();
    }
}

void game:: initGame()
{
    //formation of boundary and field
    for (size_t i = 0; i <= 20; i++)
    {
        for (size_t j = 0; j <= 11; j++)
        {
            if ((j == 0) || (j == 11) || (i == 20))
            {
                field[i][j] = stage[i][j] = 9;
            }
            else
            {
                field[i][j] = stage[i][j] = 0;
            }
        }
    }

    makeBlocks();

    display();
}

bool game:: makeBlocks()
{
    x = 4;
    y = 0;

    //get random pick of piece
    int blockType = getRandom();

    for (size_t i = 0; i < 4; i++)
    {
        for (size_t j = 0; j < 4; j++)
        {
            block[i][j] = 0;
            block[i][j] = block_list[blockType][i][j];
        }
    }

    for (size_t i = 0; i < 4; i++)
    {
        for (size_t j = 0; j < 4; j++)
        {
            field[i][j + 4] = stage[i][j + 4] + block[i][j];

            if (field[i][j + 4] > 1)
            {
                gameover = true;
                return true;
            }
        }
    }
    return false;
}

void game::moveBlock(int x2, int y2)
{

    //Remove block
    for (size_t i = 0; i < 4; i++)
    {
        for (size_t j = 0; j < 4; j++)
        {
            field[y + i][x + j] -= block[i][j];
        }
    }
    score=score+1;
    //Update coordinates
    x = x2;
    y = y2;

    // assign a block with the updated value
    for (size_t i = 0; i < 4; i++)
    {
        for (size_t j = 0; j < 4; j++)
        {
            field[y + i][x + j] += block[i][j];
        }
    }

    display();
}

void game:: collidable()
{
    for (size_t i = 0; i<21; i++)
    {
        for (size_t j = 0; j<12; j++)
        {
            stage[i][j] = field[i][j];
        }
    }
}

bool game:: isCollide(int x2, int y2)
{
    for (size_t i = 0; i < 4; i++)
    {
        for (size_t j = 0; j < 4; j++)
        {
            if (block[i][j] && stage[y2 + i][x2 + j] != 0)
            {
                return true;
            }
        }
    }
    return false;
}

void game:: userInput()
{
    char key;

    key = getch();

    switch (key)
    {
    case 'd':
        if (!isCollide(x + 1, y))
        {
            moveBlock(x + 1, y);
        }
        break;
    case 'a':
        if (!isCollide(x - 1, y))
        {
            moveBlock(x - 1, y);
        }
        break;
    case 's':
        if (!isCollide(x, y + 1))
        {
            moveBlock(x, y + 1);
        }
        break;
    case ' ':
        rotateBolck();
    }
}

bool game:: rotateBolck()
{
    std::vector<std::vector<int>> tmp(4, std::vector<int>(4, 0));

    for (size_t i = 0; i < 4; i++)
    { //Save temporarily block
        for (size_t j = 0; j < 4; j++)
        {
            tmp[i][j] = block[i][j];
        }
    }

    for (size_t i = 0; i < 4; i++)
    { //Rotate
        for (size_t j = 0; j < 4; j++)
        {
            block[i][j] = tmp[3 - j][i];
        }
    }

    if (isCollide(x, y))
    { // And stop if it overlaps not be rotated
        for (size_t i = 0; i < 4; i++)
        {
            for (size_t j = 0; j < 4; j++)
            {
                block[i][j] = tmp[i][j];
            }
        }
        return true;
    }

    for (size_t i = 0; i < 4; i++)
    {
        for (size_t j = 0; j < 4; j++)
        {
            field[y + i][x + j] -= tmp[i][j];
            field[y + i][x + j] += block[i][j];
        }
    }

    display();

    return false;
}

void game:: spwanBlock()
{
    if (!isCollide(x, y + 1))
    {
        moveBlock(x, y + 1);
    }
    else
    {
        collidable();
        makeBlocks();
        display();
    }
}