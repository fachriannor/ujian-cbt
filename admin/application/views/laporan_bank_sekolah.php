    <div class="content-wrapper">
        <section class="content-header">
            <h1 class="text-center">
                <?= $title; ?>
            </h1>
        </section>

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <section class="content">
                    <div class="box box-purple">
                        <div class="box-body">
                            <form action="<?= base_url('cetak-soal-sekolah');?>" method="post" role="form">
                                <div class="form-group">
                                    <label for="cetak-kelas">Pilih Kelas :</label>
                                    <select class="form-control" name="cetak-kelas">
                                        <option selected disabled>Pilih Kelas...</option>
                                        <?php foreach($pilihkelas as $pk){ ?>
                                        <option value="<?= $pk->id_kelas;?>"><?= $pk->kode_kelas;?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="cetak-mapel">Pilih Mata Pelajaran :</label>
                                    <select class="form-control" name="cetak-mapel">
                                        <option selected disabled>Pilih Mata Pelajaran...</option>
                                        <?php foreach($pilihmapel as $pm){ ?>
                                        <option value="<?= $pm->id_mapel;?>"><?= $pm->mapel;?></option>
                                        <?php } ?>
                                    </select>
                                </div>                                

                                <div class="form-group">
                                    <label for="cetak-kategori">Pilih Kategori Soal :</label>
                                    <select class="form-control" name="cetak-kategori">
                                        <option selected disabled>Pilih Kategori Soal...</option>
                                        <?php foreach($pilihkategori as $pk){ ?>
                                        <option value="<?= $pk->id_kategori;?>"><?= $pk->kategori;?></option>
                                        <?php } ?>
                                    </select>
                                </div>                                                                

                                <button formtarget="_blank" type="submit" class="btn btn-sm btn-success"> <i class="fa fa-print"></i> Cetak</button>
                            </form>  
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>