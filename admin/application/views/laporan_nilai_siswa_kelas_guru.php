    <div class="content-wrapper">
        <section class="content-header">
            <h1 class="text-center">
                Laporan Nilai Siswa PerMapel (Guru)
            </h1>
        </section>

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <section class="content">
                    <div class="box box-purple">
                        <div class="box-body">
                            <form action="<?= base_url('cetak-nilai-siswa-kelas-guru');?>" method="post" role="form">
                                <div class="form-group">
                                    <label for="cetak-kelas">Pilih Kelas :</label>
                                    <select class="form-control" name="cetak-kelas" required="">
                                        <option selected disabled>Pilih Kelas...</option>
                                        <?php foreach($listkelas as $lk){ ?>
                                        <option value="<?= $lk->id_kelas;?>"><?= $lk->kode_kelas;?></option>
                                        <?php } ?>
                                    </select>
                                </div>                                
                                <div class="form-group">
                                    <label for="cetak-kelas">Pilih Mata Pelajaran :</label>
                                    <select id="cetak-mapel" name="cetak-mapel" class="form-control">
                                        <option selected>Pilih Mata Pelajaran...</option>
                                        <?php foreach($listmapel as $lm){ ?>
                                        <option value="<?= $lm->id_mapel;?>" <?= $this->session->mapel == $lm->mapel ? 'selected' : '' ?>><?= $lm->mapel;?></option>
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