<div class="content-wrapper">

    <section class="content-header">
        <h1 class="text-center">
            Kelas
        </h1>
    </section>

    <section class="content">
        <div class="box box-purple">
            <div class="box-header with-border">
                <button type="button" data-toggle="modal" data-target="#tambah-kelas" class="btn btn-sm btn-flat btn-success"><i class="fa fa-plus"></i> Tambah Kelas</button>
                <!-- Modal Tambah Kelas -->
                <div class="modal fade" id="tambah-kelas">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                                <h4><i class="fa fa-th-large"></i> Tambah Data Kelas</h4>
                            </div>
                            <div class="modal-body">
                                <form action="<?= site_url('admin/tambah_kelas');?>" method="post" role="form" id="form-modal">
                                    <div class="box-body">
                                        <div class="col-sm-12 form-group">
                                            <label for="kelas">Kelas :</label>
                                            <input type="text" name="kelas" id="kelas" class="form-control" placeholder="Masukkan Kelas...">
                                        </div>
                                        <div class="col-sm-12 form-group">
                                            <label for="kodekelas">Kode Kelas :</label>
                                            <input type="text" name="kodekelas" id="kode_kelas" class="form-control" placeholder="Masukkan Kode Kelas...">
                                        </div>
                                        <div class="col-sm-12 form-group">
                                            <label for="wali">Wali Kelas :</label>
                                            <select class="form-control" name="wali" id="id_wali">
                                                <option selected disabled>Pilih Wali Kelas</option>
                                                <?php foreach($guru as $g) : ?>
                                                    <option value="<?= $g->id_guru; ?>"><?= $g->nama; ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>                                        
                                    </div>
                                    <div class="box-footer">
                                        <div class="col-sm-12 form-group">
                                            <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Simpan</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div> <!-- End Modal -->
            </div>
            <div class="box-body">
                <table class="table table-bordered table-striped table-hover" id="tabelKelas">
                    <thead>
                        <tr>
                            <th class="text-center">No.</th>
                            <th class="text-center">Kelas</th>
                            <th class="text-center">Kode Kelas</th>
                            <th class="text-center">Wali Kelas</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        foreach($kelas as $k){
                        ?>
                        <tr>
                            <td class="text-center" style="width: 1px;"><?= $no++;?>.</td>
                            <td class="text-center"><?= $k->kelas;?></td>
                            <td class="text-center"><?= $k->kode_kelas;?></td>
                            <td><?= $k->nama ?></td>
                            <td  class="text-center">
                                <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#editKelas<?= $k->id_kelas;?>"><i class="fa fa-edit"></i> Edit</button> &nbsp;
                                <button class="btn btn-xs btn-danger" data-toggle="modal" data-target="#hapusKelas<?= $k->id_kelas;?>"><i class="fa fa-trash"></i> Hapus</button>
                            </td>
                        </tr>
                        <!-- Modal Edit Kelas -->
                        <div class="modal fade" id="editKelas<?= $k->id_kelas;?>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"><i class="fa fa-th-large"></i> Edit Data Kelas</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="<?= base_url('admin/edit_kelas/'.$k->id_kelas);?>" method="post" role="form">
                                            <div class="box-body">
                                                <div class="col-sm-12 form-group">
                                                    <label for="kelas">Kelas :</label>
                                                    <input type="text" name="kelas" class="form-control" value="<?= $k->kelas;?>" placeholder="Masukkan Kelas..." required>
                                                </div>
                                                <div class="col-sm-12 form-group">
                                                    <label for="kodekelas">Kode Kelas :</label>
                                                    <input type="text" name="kodekelas" class="form-control" value="<?= $k->kode_kelas;?>" placeholder="Masukkan Kode Kelas..." required>
                                                </div>
                                                <div class="col-sm-12 form-group">
                                                    <label for="wali">Wali Kelas :</label>
                                                    <select class="form-control" name="wali" id="id_wali_edit">
                                                        <option selected disabled="">Pilih Wali Kelas</option>
                                                        <?php foreach($guru as $g) : ?>
                                                            <option value="<?= $g->id_guru; ?>" <?= $g->id_guru == $k->id_guru ? 'selected' : '' ?>><?= $g->nama; ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
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
                        <!-- Modal Hapus Kelas-->
                        <div class="modal fade" id="hapusKelas<?= $k->id_kelas;?>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"><i class="fa fa-trash"></i> Hapus Data Kelas</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="box-body">
                                            <h4>Anda yakin akan menghapus kelas <?= $k->kode_kelas;?>?</h4>
                                            <p class="text-danger">*Menghapus data siswa terpilih akan menghapus semua data yang terkait seperti nilai dan yang lainnya...</p>
                                        </div>
                                        <div class="box-footer">
                                            <a href="<?= base_url('admin/hapus_kelas/'.$k->id_kelas);?>" class="btn btn-danger">Ya</a> &nbsp;
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
</div>

<script>
$(function(){
    $('#form-modal').validate({
        rules : {
            kelas : {
                required : true,
                number : true
            },
            kodekelas : "required",
            wali : "required"                                                
        },
        messages : {
            kelas : {
                required : "Kolom masih kosong. Harap diisi",
                number : "Harap masukkan hanya angka"
            },
            kodekelas : {
                required : "Kolom masih kosong. Harap diisi",
            },
            wali : {
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
            $( element ).parents( ".col-sm-12.form-group" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
            $( element ).parents( ".col-sm-12.form-group" ).addClass( "has-success" ).removeClass( "has-error" );
        },                
    });                
    $('#tabelKelas').DataTable({
      'paging' : true,
      'lengthChange' : true,
      'searching' : true,
      'ordering' : false,
      'info' : true,
      'autoWidth' : false,
      "scrollX": true
    });

    <?php if ($this->session->flashdata('add')) : ?>
        Swal.fire('Sukses!', 'Kelas berhasil ditambahkan', 'success');
    <?php elseif ($this->session->flashdata('edit')) : ?>
        Swal.fire('Sukses!', 'Kelas berhasil diedit', 'success');
    <?php elseif ($this->session->flashdata('delete')) : ?>
        Swal.fire('Sukses!', 'Kelas berhasil dihapus', 'success');
    <?php endif; ?>       
})
</script>