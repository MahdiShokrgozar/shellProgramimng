#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <thread>
#include <pthread.h>

using namespace std;

unsigned long threadElapsedTimeMicros[10];
unsigned long threadResults[10];

void findWord(int index, string file, string word)
{
    // std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
    ifstream my_file;
    string line;

    my_file.open(file, ios::in);
    unsigned int counter = 0;

    std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
    while (getline(my_file, line))
    {
        if ((line.find(word, 0)) != std::string::npos)
        {
            counter++;
        }
    }
    std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

    my_file.close();
    // cout << "found " << counter << " word '" << word << "'"
    //      << " in file '" << file << "'" << endl;
    threadResults[index] = counter;
    // std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

    threadElapsedTimeMicros[index] =
        std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count();
}

int main()
{
    // std::chrono::steady_clock::time_point allBegin = std::chrono::steady_clock::now();

    vector<thread> t;
    string file_address = "testFile.txt";
    string word1 = "the";
    string word2 = "open";
    string word3 = "most";
    string word4 = "source";
    ifstream my_file;
    string line;

    vector<string> words;
    cout << "Enter file Name: \n";
    cin >> file_address;

    cout << "Enter the word that you want to find:\n";

    // int i = 0;

    string word;

    do
    {
        
        cin >> word;
        words.push_back(word);

    } while (word != "-1");

    int numOfThreads=words.size()-1;

    std::chrono::steady_clock::time_point allBegin = std::chrono::steady_clock::now();
    for (int j = 0; j < numOfThreads; j++)
        t.push_back(thread(findWord, j, file_address, words[j]));
    for (int j = 0; j < numOfThreads; j++)
        t[j].join();

    std::chrono::steady_clock::time_point allEnd = std::chrono::steady_clock::now();

    for (int j = 0; j < numOfThreads; j++)
        cout << "found " << threadResults[j] << " word '" << words[j] << "'"
             << " in file '" << file_address << "'"
             << ", took " << threadElapsedTimeMicros[j] << " microseconds" << std::endl;
    cout << " Total time spent doing multithreaded computations was "
         << std::chrono::duration_cast<std::chrono::microseconds>(allEnd - allBegin).count()
         << " microseconds in total" << std::endl;

    return 0;
}
