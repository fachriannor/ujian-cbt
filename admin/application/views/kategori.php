<div class="content-wrapper">

    <section class="content-header">
        <h1 class="text-center">
            Kategori Soal
        </h1>
    </section>

    <section class="content">
        <div class="box box-purple">
            <div class="box-header">
                <button type="button" data-toggle="modal" data-target="#tambah-kategori" class="btn btn-sm btn-flat btn-success"><i class="fa fa-plus"></i> Tambah Kategori Soal</button>

                <!-- Modal Tambah Pelajaran -->
                <div class="modal fade" id="tambah-kategori">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                                <h4 class="modal-title"><i class="fa fa-book"></i> Tambah Kategori Soal</h4>
                            </div>
                            <div class="modal-body">
                                <form action="<?= base_url('admin/tambah_kategori');?>" method="post" role="form" id="form-modal">
                                    <div class="box-body">
                                        <div class="col-sm-12 form-group">
                                            <label for="kategori">Kategori Soal :</label>
                                            <input type="text" name="kategori" class="form-control" placeholder="Masukkan kategori soal...">
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
                </div> <!-- End Modal Tambah Kategori Soal -->
            </div>
            <div class="box-body">
                <table id="tabelkategori" class="table table-bordered table-striped table-hover table-responsive">
                    <thead>
                        <tr>
                            <th class="text-center">No.</th>
                            <th class="text-center">Kategori Soal</th>
                            <th class="text-center" style="width: 250px;">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        foreach($kategori as $k){
                        ?>
                        <tr>
                            <td class="text-center" style="width: 1px;"><?= $no++;?>.</td>
                            <td class="text-center"><?= $k->kategori; ?></td>
                            <td class="text-center">
                                <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#editkategori<?= $k->id_kategori;?>"><i class="fa fa-edit"></i> Edit</button> &nbsp;
                                <button class="btn btn-xs btn-danger" data-toggle="modal" data-target="#hapuskategori<?= $k->id_kategori;?>"><i class="fa fa-trash"></i> Hapus</button>
                            </td>
                        </tr>
                        <!-- Modal Edit kategori -->
                        <div class="modal fade" id="editkategori<?= $k->id_kategori;?>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"><i class="fa fa-book"></i> Edit Data Kategori Soal</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="<?= base_url('admin/edit_kategori/'.$k->id_kategori);?>" method="post">
                                            <div class="box-body">
                                                <div class="col-sm-12 form-group">
                                                    <label for="kategori">Kategori Soal :</label>
                                                    <input type="text" name="kategori" class="form-control" value="<?= $k->kategori; ?>">
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
                        <!-- Modal Hapus Kategori Soal -->
                        <div class="modal fade" id="hapuskategori<?= $k->id_kategori;?>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"><i class="fa fa-trash"></i> Hapus Kategori Soal</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="box-body">
                                            <h4>Anda yakin akan menghapus kategori soal <b><?= $k->kategori;?></b> ?</h4>
                                            <p class="text-danger">*Menghapus kategori soal terpilih dapat menghapus semua data yang terkait termasuk guru, soal, maupun nilai</p>
                                        </div>
                                        <div class="box-footer">
                                            <a href="<?= base_url('admin/hapus_kategori/'.$k->id_kategori);?>" class="btn btn-danger">Ya</a> &nbsp;
                                            <button class="btn btn-default" data-dismiss="modal">Tidak</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('#form-modal').validate({
            rules : {
                kategori : "required"                                             
            },
            messages : {
                kategori : {
                    required : "Kolom masih kosong. Harap diisi"
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
        $('#tabelkategori').DataTable({
            'paging' : true,
            'lengthChange' : true,
            'searching' : true,
            'ordering' : false,
            'info' : true,
            'autoWidth' : false,                
        });
        <?php if ($this->session->flashdata('add')) : ?>
            Swal.fire('Sukses!', 'Kategori berhasil ditambahkan', 'success');
        <?php elseif ($this->session->flashdata('edit')) : ?>
            Swal.fire('Sukses!', 'Kategori berhasil diedit', 'success');
        <?php elseif ($this->session->flashdata('delete')) : ?>
            Swal.fire('Sukses!', 'Kategori berhasil dihapus', 'success');
        <?php endif; ?>        
    })
</script>