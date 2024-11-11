abstract class Karyawan {
  totalgaji(){

  }
}

class KaryawanKontrak extends Karyawan{

  int upahHarian;
  int tunjanganAnak;
  int hariKerja;

  KaryawanKontrak(this.upahHarian,this.tunjanganAnak,this.hariKerja);

  @override
  int totalgaji() {
    return upahHarian*hariKerja+tunjanganAnak;
  }
}

class KaryawanTetap extends Karyawan{

  int gajiPokok;
  int tunjanganAnak;

  KaryawanTetap(this.gajiPokok,this.tunjanganAnak);
  @override
  int totalgaji() {
    return gajiPokok+tunjanganAnak;
  }
  
}
