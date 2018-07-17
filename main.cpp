#include <iostream>
#include <string>


using namespace std;

 int counter = 0;

void displayinfo(string answer)
{


   if(answer.compare("triangle")==0)
   {
       cout<<"area = 1/2*b*h";
       counter++;

   }
   else if(answer.compare("circle")==0)
   {
       cout<<"area = pi*r*r";
       cout <<"\nPerimeter = 2 *pi*r";
       counter++;


   }
   else if(answer.compare("rectangle")==0)
   {
       cout<<"area = l*b";
       cout <<"\nPerimeter = 2*l+2*b";
       counter++;


   }

   else if(answer.compare("exit")==0)
   {
    cout<<"\nshapes entered:  "<<counter<<endl;
      exit(0);

   }

   else
    {
    cout<<"shape not available";
   counter++;

   }


}

int main()
{
    string input;
   cout<<"***Shapes***";
   for(int i=1; i<10;i++)
   {
     cout<<"\n"<<i<<" .shape: ";
   getline(cin,input);

   displayinfo(input);
   }
}

