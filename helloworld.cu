#include<iostream>
#include<thrust/reduce.h>
#include<thrust/sequence.h>
#include<thrust/host_vector.h>
#include<thrust/device_vector.h>

using namespace std;
int main(){
    const int N=5000;
    thrust::device_vector<int> a(N);
    //填充数组
    thrust::sequence(a.begin(),a.end(),0);
    //计算数组各个元素之和
    int SUM=thrust::reduce(a.begin(),a.end(),0);
    int sumCheck=0;
    for(int i=0;i<N;i++)sumCheck+=i;
    if(sumCheck==SUM)cout<<"hello world;"<<endl;
    else{
        cerr<<"Test failed!"<<endl;
        return -1;
    }
    return 0;

}