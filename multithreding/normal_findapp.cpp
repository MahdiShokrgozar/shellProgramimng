#include <iostream>
#include <fstream>
#include <string>
#include <tuple>
#include <time.h>
#include <chrono>

using namespace std;

tuple<int,int> findWord(string file, string word)
{

    ifstream my_file;
    string line;

    my_file.open(file, ios::in);
    unsigned int counter = 0;
    chrono::steady_clock::time_point begin = chrono::steady_clock::now();
    while (getline(my_file, line))
    {
        if ((line.find(word, 0)) != string::npos)
        {
            counter++;
        }
    }
    chrono::steady_clock::time_point end = chrono::steady_clock::now();
     my_file.close();
    int time=chrono::duration_cast<chrono::microseconds>(end - begin).count();
    return make_tuple(counter,time);
}

int main()
{

    string file_address = "testFile.txt";
    string my_word = "the";
    ifstream my_file;
    string line;

    // cout << "Enter file Name: \n";
    // cin >> file_address;

    // cout << "Enter the word that you want to find:\n";
    // cin >> my_word;

    int findword ,time;
    chrono::steady_clock::time_point allBegin = chrono::steady_clock::now();

     tie(findword,time)= findWord(file_address, my_word);

    chrono::steady_clock::time_point allEnd = chrono::steady_clock::now();

    cout << "found " << findword << " word '" << my_word << "'"
         << " in file '" << file_address << "'" << endl;

    cout << "threatime: " << time << endl;

    cout << " Total time spent doing multithreaded computations was "
         << chrono::duration_cast<chrono::microseconds>(allEnd - allBegin).count()
         << " microseconds in total" << endl;

    return 0;
}