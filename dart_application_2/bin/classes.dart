import 'dart:math';

class Persegi{
  int p =0, l =0;
  int luas =0;

  Persegi({required this.p, required this.l});

  int getLuas(){
    return p*l;
  }

  int getKeliling(){
    return (p+l)*2;
  }

  int get getp{
    return p;
  }

  int get getl{
    return l;
  }

  set setp(int i){
    p = i;
  }

  set setl(int i){
    l = i;
  }
}

class Segitiga{
  int a =0, t =0;
  int luas =0;

  Segitiga({required this.a, required this.t});

  double getluas(){
    return a*t*1/2;
  }

  double getKeliling(){
    return (sqrt(pow(1/2*a,2)+pow(t,2)))*2+a;
  }

  int get geta{
    return a;
  }

  int get gett{
    return t;
  }

  set seta(int i){
    a = i;
  }

  set sett(int i){
    t = i;
  }
}

class Lingkaran{
  int r =0, luas =0;
  double phi = 22/7;

  Lingkaran({required this.r});

  double getluas(){
    return phi*r*r;
  }

  double getKeliling(){
    return phi*2*r;
  }

  int get getr{
    return r;
  }

  set setr(int i){
    r = i;
  }
}

class Kubus{
  int p =0;

  Kubus({required this.p});

  int getVolume(){
    return p*p*p;
  }

  int getKeliling(){
    return p*12;
  }

  int get getp{
    return p;
  }

  set setp(int i){
    p = i;
  }
}