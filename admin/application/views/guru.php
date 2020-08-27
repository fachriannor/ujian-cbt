    <div class="content-wrapper">
        <section class="content-header">
            <h1 class="text-center">
                Daftar Guru
            </h1>
        </section>
        <section class="content">
            <div class="box box-purple">
                <div class="box-header">  
                    <button type="button" data-toggle="modal" data-target="#tambah-guru" class="btn btn-sm btn-flat btn-success"><i class="fa fa-user-plus"></i> Tambah Guru</button>

                    <!-- Modal Tambah Guru -->
                    <div class="modal fade" id="tambah-guru">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title"><i class="fa fa-users"></i> Tambah Guru</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="<?= base_url('admin/tambah_guru');?>" method="post" role="form" id="form-modal">
                                        <div class="box-body">
                                            <div class="col-sm-6 form-group">
                                                <label for="nama">Nama Guru :</label>
                                                <input type="text" name="nama" id="nama" class="form-control" placeholder="Masukkan Nama Guru...">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="nip">NIP :</label>
                                                <input type="text" name="nip" id="nip" class="form-control" placeholder="Masukkan Nip...">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="nuptk">NUPTK :</label>
                                                <input type="text" name="nuptk" id="nuptk" class="form-control" placeholder="Masukkan NUPTK...">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="jenis_kelamin">Jenis Kelamin :</label>
                                                <select class="form-control mapel" name="jenis_kelamin" id="jenis_kelamin">
                                                    <option selected disabled>Pilih Jenis Kelamin...</option>
                                                    <option value="Laki-Laki">Laki-Laki</option>
                                                    <option value="Perempuan">Perempuan</option>
                                                </select>
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="tempat_lahir">Tempat Lahir :</label>
                                                <input type="text" name="tempat_lahir" id="tempat_lahir" class="form-control" placeholder="Masukkan Tempat Lahir...">
                                            </div> 

                                            <div class="col-sm-6 form-group">
                                                <label for="tanggal_lahir">Tanggal Lahir :</label>
                                                <input type="date" name="tanggal_lahir" id="tanggal_lahir" class="form-control">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="no_hp">No HP :</label>
                                                <input type="text" name="no_hp" id="no_hp" class="form-control" placeholder="Masukkan No HP...">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="agama">Agama :</label>
                                                <select class="form-control agama" name="agama" id="agama">
                                                    <option selected disabled="">Pilih Agama...</option>
                                                    <option value="Islam">Islam</option>
                                                    <option value="Kristen">Kristen</option>
                                                    <option value="Budha">Budha</option>
                                                    <option value="Hindu">Hindu</option>
                                                </select>
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="pendidikan" id="pendidikan">Pendidikan :</label>
                                                <input type="text" name="pendidikan" class="form-control" placeholder="Masukkan Pendidikan Guru...">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="mapel">Mata Pelajaran :</label>
                                                <select class="form-control mapel" name="mapel" id="mapel">
                                                    <option selected disabled>Pilih Mata Pelajaran...</option>
                                                    <?php foreach($listmapel as $lm){ ?>
                                                    <option value="<?= $lm->id_mapel;?>"><?= $lm->mapel;?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>

                                            <div class="col-sm-12 form-group">
                                                <label for="alamat">Alamat :</label>
                                                <input type="text" name="alamat" id="alamat" class="form-control" placeholder="Masukkan Alamat...">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="user">User :</label>
                                                <input type="text" name="username" id="username" class="form-control" placeholder="Masukkan Username Guru...">
                                            </div>

                                            <div class="col-sm-6 form-group">
                                                <label for="password">Password :</label>
                                                <input type="password" name="password" id="password" class="form-control" placeholder="Masukkan Password Guru...">
                                            </div>

                                        </div>

                                        <div class="box-footer">
                                            <div class="col-sm-12 form-group">
                                                <button type="submit" class="btn btn btn-success"> <i class="fa fa-save"></i> Simpan</button>
                                                <button type="reset" class="btn btn btn-warning"> <i class="fa fa-times-o"></i> Reset</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> <!-- End Modal Tambah Guru -->
                </div>
                <div class="box-body">
                    <table id="tabelGuru" class="table table-sm table-bordered table-sm table-striped table-hover table-responsive">
                        <thead>
                            <tr>
                                <th class="text-center">No.</th>
                                <th class="text-center">NIP</th>
                                <th class="text-center">NUPTK</th>
                                <th class="text-center">Nama</th>
                                <th class="text-center">Jenis Kelamin</th>
                                <th class="text-center">Tempat Lahir</th>
                                <th class="text-center">Tanggal Lahir</th>
                                <th class="text-center">Alamat</th>
                                <th class="text-center">No.Hp</th>
                                <th class="text-center">Agama</th>
                                <th class="text-center">Pendidikan</th>
                                <th class="text-center">Mata Pelajaran</th>
                                <th class="text-center">Login</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach($guru as $g){
                            ?>
                            <tr>
                                <td><?= $no++;?>.</td>
                                <td><?= $g->nip;?></td>
                                <td><?= $g->nuptk;?></td>
                                <td><?= $g->nama;?></td>
                                <td><?= $g->jenis_kelamin;?></td>
                                <td><?= $g->tmpt_lahir;?></td>
                                <td><?= format_hari_tanggal($g->tgl_lahir) ?></td>
                                <td><?= $g->alamat;?></td>
                                <td><?= $g->no_hp;?></td>
                                <td><?= $g->agama;?></td>
                                <td><?= $g->pendidikan;?></td>
                                <td><?= $g->mapel;?></td>
                                <td class="text-center"><button class="btn btn-xs btn-info" data-toggle="modal" data-target="#lihatLogin<?= $g->id_guru;?>"><i class="fa fa-eye"></i> Lihat</button></td>
                                <td class="text-center">
                                    <button type="button" data-toggle="modal" data-target="#editGuru<?= $g->id_guru;?>" class="btn btn-xs btn-warning"><i class="fa fa-edit"></i> Edit</button> &nbsp;
                                    <button type="button" data-toggle="modal" data-target="#hapusGuru<?= $g->id_guru;?>" class="btn btn-xs btn-danger"><i class="fa fa-user-times"></i> Hapus</button>
                                </td>
                            </tr>
                                <!-- Modal Lihat Login Guru -->
                                <div class="modal fade" id="lihatLogin<?= $g->id_guru;?>">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title"><i class="fa fa-eye"></i> Informasi Login</h4>
                                            </div>

                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="username">Username :</label>
                                                    <input type="text" value="<?= $g->username;?>" class="form-control" disabled>
                                                </div>

                                                <div class="form-group">
                                                    <label for="password">Password :</label>
                                                    <input type="text" value="<?= $g->password;?>" class="form-control" disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal Edit Data Guru -->
                                <div id="editGuru<?= $g->id_guru;?>" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title"><i class="fa fa-users"></i> Edit Data Guru</h4>
                                            </div>

                                            <div class="modal-body">
                                                <form action="<?= base_url('admin/edit_guru/'.$g->id_guru);?>" method="post" role="form" id="formModalEdit">
                                                    <div class="box-body">
                                                        <div class="col-sm-6 form-group">
                                                            <label for="nama">Nama :</label>
                                                            <input type="text" name="nama" id="nama_edit" class="form-control" value="<?= $g->nama;?>" placeholder="Masukkan Nama Guru...">
                                                        </div> 

                                                        <div class="col-sm-6 form-group">
                                                            <label for="nip">NIP :</label>
                                                            <input type="text" name="nip" id="nip_edit" class="form-control" value="<?= $g->nip; ?>" placeholder="Masukkan Nip...">
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label for="nuptk">NUPTK :</label>
                                                            <input type="text" name="nuptk" id="nuptk_edit" class="form-control" placeholder="Masukkan NUPTK..." value="<?= $g->nuptk; ?>">
                                                        </div>                                                        

                                                        <div class="col-sm-6 form-group">
                                                            <label for="jenis_kelamin">Jenis Kelamin :</label>
                                                            <select class="form-control" name="jenis_kelamin" id="jenis_kelamin_edit">
                                                                <option value="Laki-Laki" <?= $g->jenis_kelamin == 'Laki-Laki' ? 'selected' : '' ?>>Laki-Laki</option>
                                                                <option value="Perempuan" <?= $g->jenis_kelamin == 'Perempuan' ? 'selected' : '' ?>>Perempuan</option>
                                                            </select>
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label for="tempat_lahir">Tempat Lahir :</label>
                                                            <input type="text" name="tempat_lahir" id="tempat_lahir_edit" class="form-control" placeholder="Masukkan Tempat Lahir..." value="<?= $g->tmpt_lahir; ?>">
                                                        </div>                                                                    
                                                        <div class="col-sm-6 form-group">
                                                            <label for="tanggal_lahir">Tanggal Lahir :</label>
                                                            <input type="date" name="tanggal_lahir" id="tanggal_lahir_edit" class="form-control" value="<?= $g->tgl_lahir; ?>">
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label for="no_hp">No HP :</label>
                                                            <input type="text" name="no_hp" id="no_hp_edit" class="form-control" placeholder="Masukkan No HP..." value="<?= $g->no_hp ?>">
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label for="agama">Agama :</label>
                                                            <select class="form-control" name="agama" id="agama_edit">
                                                                <option selected disabled>Pilih Agama...</option>
                                                                <option value="Islam" <?= $g->agama == 'Islam' ? 'selected' : '' ?>>Islam</option>
                                                                <option value="Kristen" <?= $g->agama == 'Kristen' ? 'selected' : '' ?>>Kristen</option>
                                                                <option value="Budha" <?= $g->agama == 'Budha' ? 'selected' : '' ?>>Budha</option>
                                                                <option value="Hindu" <?= $g->agama == 'Hindu' ? 'selected' : '' ?>>Hindu</option>                                                   
                                                            </select>
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label for="pendidikan">Pendidikan :</label>
                                                            <input type="text" name="pendidikan" id="pendidikan_edit" class="form-control" placeholder="Masukkan Pendidikan Guru..." value="<?= $g->pendidikan ?>">
                                                        </div>    

                                                        <div class="col-sm-6 form-group">
                                                            <label for="mapel">Mata Pelajaran :</label>
                                                            <select class="form-control" name="mapel" id="mapel_edit">
                                                                <option value="<?= $g->id_mapel;?>" selected><?= $g->mapel;?></option>
                                                                <?php
                                                                foreach($listmapel as $lm){
                                                                ?>
                                                                <option value="<?= $lm->id_mapel;?>"><?= $lm->mapel;?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>

                                                        <div class="col-sm-12 form-group">
                                                            <label for="alamat">Alamat :</label>
                                                            <input type="text" name="alamat" id="alamat_edit" class="form-control" placeholder="Masukkan Alamat..." value="<?= $g->alamat; ?>">
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label for="user">User :</label>
                                                            <input type="text" name="username" id="username_edit" value="<?=$g->username;?>" class="form-control" placeholder="Masukkan Username Guru...">
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label for="password">Password :</label>
                                                            <input type="password" name="password" id="password_edit" value="<?=$g->password;?>" class="form-control" placeholder="Masukkan Password Guru...">
                                                        </div>
                                                    </div>

                                                    <div class="box-footer">
                                                        <div class="col-sm-12 form-group">
                                                            <button type="submit" class="btn btn-success"><i class="fa fa-edit"></i> Edit</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- End Modal -->
                                <!-- Modal Hapus Data Guru -->
                                <div class="modal fade" id="hapusGuru<?= $g->id_guru;?>">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title"><i class="fa fa-trash"></i> Hapus Data Guru</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="box-body">
                                                    <h4>Anda yakin akan menghapus <b><?= $g->nama;?></b> ?</h4>
                                                    <p class="text-danger">*Menghapus data terpilih dapat menghapus semua data yang terkait seperti soal dan lainnya...</p>
                                                </div>
                                                <div class="box-footer">
                                                    <a href="<?= base_url('admin/hapus_guru/'.$g->id_guru);?>" class="btn btn-danger">Ya</a> &nbsp;
                                                    <button class="btn btn-default" data-dismiss="modal">Tidak</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- End Modal-->
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>

    <script>
        $(document).ready(function(){
            $('#form-modal').validate({
                rules : {
                    nama : {
                        required : true,
                        minlength : 2
                    },
                    nuptk : {
                        required : true,
                        number : true,
                        minlength : 2
                    },
                    nip : {
                        required : true,
                        number : true,
                        minlength : 2
                    },
                    jenis_kelamin : "required",
                    tempat_lahir : {
                        required : true,
                        minlength : 2
                    },
                    tanggal_lahir : "required",            
                    no_hp : {
                        required : true,
                        number : true,
                        minlength : 2
                    },
                    agama : "required",
                    pendidikan : "required",
                    mapel : "required",
                    alamat : {
                        required : true,
                        minlength : 2
                    },
                    username : "required",
                    password : "required"                                                
                },
                messages : {
                    nama : {
                        required : "Kolom masih kosong. Harap diisi",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    nip : {
                        required : "Kolom masih kosong. Harap diisi",
                        number : "Harap masukkan hanya angka",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    nuptk : {
                        required : "Kolom masih kosong. Harap diisi",
                        number : "Harap masukkan hanya angka",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    jenis_kelamin : {
                        required : "Kolom masih kosong. Harap diisi",
                    },
                    tempat_lahir : {
                        required : "Kolom masih kosong. Harap diisi",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    tanggal_lahir : {
                        required : "Kolom masih kosong. Harap diisi",
                    },
                    no_hp : {
                        required : "Kolom masih kosong. Harap diisi",
                        number : "Harap masukkan hanya angka",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    agama : {
                        required : "Kolom masih kosong. Harap diisi",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    pendidikan : {
                        required : "Kolom masih kosong. Harap diisi",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    mapel : {
                        required : "Kolom masih kosong. Harap diisi",
                    },
                    alamat : {
                        required : "Kolom masih kosong. Harap diisi",
                        minlength : "Mohon masukkan lebih dari {0}"
                    },
                    username : {
                        required : "Kolom masih kosong. Harap diisi",
                    },
                    password : {
                        required : "Kolom masih kosong. Harap diisi",
                    }                                                                                                                                                                           
                },
                errorElement: "em",
                errorPlacement: function ( error, element ) {
                    // Add the `help-block` class to the error element
                    error.addClass( "help-block" );
                    error.insertAfter( element );
                },
                highlight: function ( element, errorClass, validClass ) {
                    $( element ).parents( ".col-sm-6.form-group" ).addClass( "has-error" ).removeClass( "has-success" );
                    $( element ).parents( ".col-sm-12.form-group" ).addClass( "has-error" ).removeClass( "has-success" );
                },
                unhighlight: function (element, errorClass, validClass) {
                    $( element ).parents( ".col-sm-6.form-group" ).addClass( "has-success" ).removeClass( "has-error" );
                    $( element ).parents( ".col-sm-12.form-group" ).addClass( "has-success" ).removeClass( "has-error" );
                },                
            });            

            $('#tabelGuru').DataTable({
                'paging' : true,
                'lengthChange' : true,
                'searching' : true,
                'ordering' : false,
                'info' : true,
                'autoWidth' : false,                
                'scrollX': true
            });
            // $('.mapel').selectize();
            // $('#mapel_edit').selectize();
            // $('.agama').selectize();
            // $('#agama_edit').selectize();
            // $('.jenis_kelamin').selectize();
            // $('#jenis_kelamin_edit').selectize();
            <?php
            if ($this->session->flashdata('add')) : ?>
                Swal.fire('Sukses!', 'Guru berhasil ditambahkan', 'success');
            <?php elseif ($this->session->flashdata('edit')) : ?>
                Swal.fire('Sukses!', 'Guru berhasil diedit', 'success');
            <?php elseif ($this->session->flashdata('delete')) : ?>
                Swal.fire('Sukses!', 'Guru berhasil dihapus', 'success');
            <?php endif; ?>

        });
    </script>   