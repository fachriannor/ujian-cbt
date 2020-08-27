<?php
defined('BASEPATH') OR exit('No direct script access allowed');

date_default_timezone_set("Asia/singapore");

class Admin extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		date_default_timezone_set('Asia/singapore');
        $this->db->query('SET time_zone="+8:00"');
		if(!$this->session->status){
			redirect('login');
		}

		$this->load->helper('format_tanggal');
		$this->load->model('M_Admin', 'm_admin');
	}

	//Header
	private function header($data){
		//admin
		if ($this->session->status == 'admin') {
			# code...
			$data['perkelas'] = $this->m_admin->perkelas()->result();
		}
		//Guru
		if ($this->session->status == 'guru') {
			# code...
			$guru = $this->session->id;
			$data['perkelas_g'] = $this->m_admin->perkelas_g($guru)->result();
		}
		//$data['perkelas'] = $this->m_admin->perkelas()->result();

		$this->load->view('template/header', $data);
	}

	//Logout
	public function logout(){
		$this->session->sess_destroy();
		redirect('login');
	}

	function kepala_sekolah() {
		return $this->db->query("select * from admin where jabatan = 'Kepala Sekolah'");
	}

	//Index
	public function index(){
		//Cek Password Guru
		if($this->session->status == 'guru'){
			$where = array(
				'id_guru' => $this->session->id
			);
			$data['passwdguru'] = $this->m_admin->cek_passwd_guru($where)->row_array();
		}

		$data['jmlmapel'] = $this->m_admin->list_mapel()->num_rows();
		$data['jmlsiswa'] = $this->m_admin->list_siswa()->num_rows();
		$data['jmlguru'] = $this->m_admin->list_guru()->num_rows();
		$data['jmlkelas'] = $this->m_admin->list_kelas()->num_rows();

		$data['title'] = 'Dashboard';

		$this->header($data);
		$this->load->view('utama');
		$this->load->view('template/footer');
	}

	//Guru
	public function guru(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Guru';
		$data['guru'] = $this->m_admin->list_guru()->result();
		$data['listmapel'] = $this->m_admin->list_mapel()->result();

		$this->header($data);
		$this->load->view('guru');
		$this->load->view('template/footer');
	}

	public function tambah_guru(){
		if($this->session->status != 'admin'){
			redirect('');
		}
	
		$nama = $this->input->post('nama');
		$nuptk = $this->input->post('nuptk');
		$nip = $this->input->post('nip');
		$jenis_kelamin = $this->input->post('jenis_kelamin');
		$tempat_lahir = $this->input->post('tempat_lahir');
		$tanggal_lahir = $this->input->post('tanggal_lahir');
		$no_hp = $this->input->post('no_hp');
		$alamat = $this->input->post('alamat');
		$pendidikan = $this->input->post('pendidikan');
		$agama = $this->input->post('agama');
		$mapel = $this->input->post('mapel');
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$data = array(
			'nama' => $nama,
			'nuptk' => $nuptk,
			'nip' => $nip,
			'jenis_kelamin' => $jenis_kelamin,
			'tmpt_lahir' => $tempat_lahir,
			'tgl_lahir' => $tanggal_lahir,
			'no_hp' => $no_hp,
			'alamat' => $alamat,
			'agama' => $agama,
			'pendidikan' => $pendidikan,
			'mapel' => $mapel,
			'username' => $username,
			'password' => $password
		);
		$this->m_admin->insert_guru('guru', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('add', 'Guru berhasil ditambahkan');
        }

		redirect('guru');
	}

	public function edit_guru($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$nama = $this->input->post('nama');
		$nuptk = $this->input->post('nuptk');
		$nip = $this->input->post('nip');
		$jenis_kelamin = $this->input->post('jenis_kelamin');
		$tempat_lahir = $this->input->post('tempat_lahir');
		$tanggal_lahir = $this->input->post('tanggal_lahir');
		$no_hp = $this->input->post('no_hp');
		$alamat = $this->input->post('alamat');
		$pendidikan = $this->input->post('pendidikan');
		$agama = $this->input->post('agama');
		$mapel = $this->input->post('mapel');
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$where = array('id_guru' => $id);
		$data = array(
			'nama' => $nama,
			'nuptk' => $nuptk,
			'nip' => $nip,
			'jenis_kelamin' => $jenis_kelamin,
			'tmpt_lahir' => $tempat_lahir,
			'tgl_lahir' => $tanggal_lahir,
			'no_hp' => $no_hp,
			'alamat' => $alamat,
			'agama' => $agama,
			'pendidikan' => $pendidikan,
			'mapel' => $mapel,
			'username' => $username,
			'password' => $password
		);
		$this->m_admin->update_guru($where, 'guru', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('edit', 'Guru berhasil diubah');
        }

		redirect('guru');
	}

	public function hapus_guru($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$where = array('id_guru' => $id);
		$this->m_admin->delete_guru($where, 'guru');
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('delete', 'Guru berhasil dihapus');
        }		

		redirect('guru');
	}

	public function laporan_guru() {
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Laporan Guru';
		$data['listmapel'] = $this->m_admin->list_mapel()->result();

		$this->header($data);
		$this->load->view('laporan_guru');
		$this->load->view('template/footer');		
	}

	public function cetak_guru(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$mapel = $this->input->post('cetak-mapel');
		if($mapel != "") {
			$data['guru'] = $this->m_admin->cetak_guru($mapel)->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_guru', $data);
		} else {
			$data['guru'] = $this->m_admin->list_guru()->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_guru_semua', $data);			
		}

	}

	//Mapel
	public function mapel(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Mata Pelajaran';

		$data['mapel'] = $this->m_admin->list_mapel()->result();

		$this->header($data);
		$this->load->view('mapel');
		$this->load->view('template/footer');
	}

	public function tambah_mapel(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$mapel = $this->input->post('mapel');
		$data = array('mapel' => $mapel);
		$this->m_admin->insert_mapel('mapel', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('add', 'Mata Pelajaran berhasil ditambahkan');
        }

		redirect('mapel');
	}

	public function edit_mapel($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$mapel = $this->input->post('mapel');
		$where = array('id_mapel' => $id);
		$data = array('mapel' => $mapel);
		$this->m_admin->update_mapel($where, 'mapel', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('edit', 'Mata Pelajaran berhasil diubah');
        }	

		redirect('mapel');
	}
	public function hapus_mapel($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$where = array('id_mapel' => $id);
		$this->m_admin->delete_mapel($where, 'mapel');
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('delete', 'Mata Pelajaran berhasil dihapus');
        }

		redirect('mapel');
	}

	//Kategori
	public function kategori(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Kategori Soal';

		$data['kategori'] = $this->m_admin->list_kategori()->result();

		$this->header($data);
		$this->load->view('kategori');
		$this->load->view('template/footer');
	}

	public function tambah_kategori(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$kategori = $this->input->post('kategori');
		$data = array('kategori' => $kategori);
		$this->m_admin->insert_kategori('kategori', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('add', 'Kategori berhasil ditambahkan');
        }

		redirect('kategori');
	}
	public function edit_kategori($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$kategori = $this->input->post('kategori');
		$where = array('id_kategori' => $id);
		$data = array('kategori' => $kategori);
		$this->m_admin->update_kategori($where, 'kategori', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('edit', 'Kategori berhasil diubah');
        }	

		redirect('kategori');
	}
	public function hapus_kategori($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$where = array('id_kategori' => $id);
		$this->m_admin->delete_kategori($where, 'kategori');
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('delete', 'Kategori berhasil dihapus');
        }

		redirect('kategori');
	}	

	//Siswa
	public function siswa(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Siswa';
		$data['siswa'] = $this->m_admin->list_siswa()->result();
		$data['listkelas'] = $this->m_admin->list_kelas()->result();

		$this->header($data);
		$this->load->view('siswa');
		$this->load->view('template/footer');
	}

	public function tambah_siswa(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$nama = $this->input->post('nama');
		$nis = $this->input->post('nis');
		$jenis_kelamin = $this->input->post('jenis_kelamin');
		$kelas = $this->input->post('kelas');
		$tmpt_lahir = $this->input->post('tmpt_lahir');
		$tgl_lahir = $this->input->post('tgl_lahir');
		$alamat = $this->input->post('alamat');
		$password = $this->input->post('nis');
		$nohp = $this->input->post('nohp');
		$tahun = $this->input->post('tahun');


        $config['upload_path']      = './../upload/foto/';
        $config['allowed_types']    = 'gif|jpg|png|jpeg|pdf|doc|docx';
        $config['file_name']        = $nis;
        $config['overwrite']        = true;
        $config['max_size']         = 51200; // 1MB

        $image = null;

        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if (!$this->upload->do_upload('foto')) {
            $image = 'default.jpg';
        } else {
            $img = $this->upload->data();
            //Compress Image
            $config['image_library']    = 'gd2';
            $config['source_image']     = './../upload/foto/'.$img['file_name'];
            $config['create_thumb']     = false;
            $config['maintain_ratio']   = false;
            $config['quality']          = '100%';
            $config['width']            = 200;
            $config['height']           = 200;
            $config['new_image']        = './../upload/foto/'.$img['file_name'];
            $this->load->library('image_lib', $config);
            $this->image_lib->resize();

            $image = $img['file_name'];
        }		
		$data = array(
			'nama' => $nama,
			'jenis_kelamin' => $jenis_kelamin,
			'nis' => $nis,
			'kelas' => $kelas,
			'tmpt_lahir' => $tmpt_lahir,
			'tgl_lahir' => $tgl_lahir,
			'alamat' => $alamat,
			'password' => $password,
			'nohp' => $nohp,
			'tahun_ajaran' => $tahun,
			'foto' => $image,

		);
		$this->m_admin->insert_siswa('siswa', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('add', 'Siswa berhasil ditambahkan');
        }

		redirect('siswa');
	}

	public function edit_siswa($id){
		if($this->session->status != 'admin'){
			redirect('');
		}
		$nama = $this->input->post('nama');
		$nis = $this->input->post('nis');
		$jenis_kelamin = $this->input->post('jenis_kelamin');
		$kelas = $this->input->post('kelas');
		$tmpt_lahir = $this->input->post('tmpt_lahir');
		$tgl_lahir = $this->input->post('tgl_lahir');
		$alamat = $this->input->post('alamat');
		$nohp = $this->input->post('nohp');
		$tahun = $this->input->post('tahun');
		$password = $this->input->post('password');
		$pertanyaan = $this->input->post('pertanyaan');
		$jawaban = $this->input->post('jawaban');

            $config['upload_path']      = './../upload/foto/';
            $config['allowed_types']    = 'gif|jpg|png|jpeg|pdf|doc';
            $config['file_name']        = $nis;
            $config['overwrite']        = true;
            $config['max_size']         = 102400; // 1MB

            $this->load->library('upload', $config);
            $this->upload->initialize($config);

            $image = null;

            if (!empty($_FILES['foto']['name'])) {
                if ($this->upload->do_upload('foto')) {
                    $img = $this->upload->data();
                    //Compress Image
                    $config['image_library']    = 'gd2';
                    $config['source_image']     = './../upload/foto/'.$img['file_name'];
                    $config['create_thumb']     = false;
                    $config['maintain_ratio']   = false;
                    $config['quality']          = '100%';
                    $config['width']            = 200;
                    $config['height']           = 200;
                    $config['new_image']        = './../upload/foto/'.$img['file_name'];
                    $this->load->library('image_lib', $config);
                    $this->image_lib->resize();

                    $image = $img['file_name'];
                }
            } else {
                $image = $this->input->post('foto_lama');
            }		

		$data = array(
			'nama' => $nama,
			'nis' => $nis,
			'jenis_kelamin' => $jenis_kelamin,
			'kelas' => $kelas,
			'tmpt_lahir' => $tmpt_lahir,
			'tgl_lahir' => $tgl_lahir,
			'alamat' => $alamat,			
			'password' => $password,
			'nohp' => $nohp,
			'tahun_ajaran' => $tahun,
			'foto' => $image,
			'pertanyaan' => $pertanyaan,
			'jawaban' => $jawaban
		);
		$where = array('id_siswa' => $id);
		$this->m_admin->update_siswa('siswa', $data, $where);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('edit', 'Siswa berhasil diubah');
        }	

		redirect('siswa');
	}

	public function hapus_siswa($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$where = array('id_siswa' => $id);
		$this->m_admin->delete_siswa($where, 'siswa');
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('delete', 'Siswa berhasil dihapus');
        }

		redirect('siswa');
	}

	public function cetak_kartu($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$where = array('id_siswa' => $id);
		$data['siswa'] = $this->m_admin->kartu_peserta($where)->result();
		$data['kepala_sekolah'] = $this->kepala_sekolah()->result();

		$this->load->view('cetak_kartu', $data);
	}

	//Siswa
	public function laporan_siswa() {
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Laporan Siswa';
		$data['listkelas'] = $this->m_admin->list_kelas()->result();

		$this->header($data);
		$this->load->view('laporan_siswa');
		$this->load->view('template/footer');
	}	

	public function cetak_siswa(){
		if($this->session->status != 'admin'){
			redirect('');
		}		

		$kelas = $this->input->post('cetak-kelas');
		$tahun = $this->input->post('cetak-tahun');
		if($kelas != "" && $tahun == "") {
			$data['cetak'] = $this->m_admin->cetak_siswa_kelas($kelas)->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_siswa_kelas', $data);
		}

		if($tahun != "" && $kelas == "") {
			$data['cetak'] = $this->m_admin->cetak_siswa_tahun($tahun)->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_siswa_tahun', $data);
		}

		if($kelas != "" && $tahun !="") {
			$data['cetak'] = $this->m_admin->cetak_siswa_kelas_tahun($kelas, $tahun)->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_siswa_kelas_tahun', $data);			
		}

		if($kelas == "" && $tahun == "") {
			$data['cetak'] = $this->m_admin->list_siswa()->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_siswa_semua', $data);						
		}
	}
	//Kelas
	public function kelas(){
		if($this->session->status != 'admin'){
			redirect('');
		}
		$data['title'] = 'Kelas';

		$data['kelas'] = $this->m_admin->list_kelas()->result();
		$data['guru'] = $this->m_admin->list_guru()->result();

		$this->header($data);
		$this->load->view('kelas');
		$this->load->view('template/footer');
	}

	public function tambah_kelas(){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$kelas = $this->input->post('kelas');
		$kodekelas = $this->input->post('kodekelas');
		$wali = $this->input->post('wali');
		$data = array(
			'kelas' => $kelas,
			'kode_kelas' => $kodekelas,
			'id_guru' => $wali
		);
		$this->m_admin->insert_kelas('kelas', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('add', 'Kelas berhasil ditambahkan');
        }	

		redirect('kelas');
	}

	public function edit_kelas($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$kelas = $this->input->post('kelas');
		$kodekelas = $this->input->post('kodekelas');
		$wali = $this->input->post('wali');
		$data = array(
			'kelas' => $kelas,
			'kode_kelas' => $kodekelas,
			'id_guru' => $wali
		);
		$where = array('id_kelas' => $id);
		$this->m_admin->update_kelas($where, 'kelas', $data);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('edit', 'Kelas berhasil diubah');
        }	

		redirect('kelas');
	}

	public function hapus_kelas($id){
		if($this->session->status != 'admin'){
			redirect('');
		}

		$where = array('id_kelas' => $id);
		$this->m_admin->delete_kelas($where, 'kelas');
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('delete', 'Kelas berhasil dihapus');
        }

		redirect('kelas');
	}

	//Soal
	public function soal($pjk){
		//$data['title'] = 'Soal';
		$mapel = $this->input->get('id_mapel');
		$kategori = $this->input->get('id_kategori');

		$vkelas = array('id_kelas' => $pjk);
		$data['kelas'] = $this->m_admin->vkelas($vkelas)->row_array();		
		$data['title'] = 'Soal '.$data['kelas']['kode_kelas'];
		
		//admin
		if($this->session->status == 'admin'){
			$data['pilihmapel'] = $this->m_admin->list_mapel()->result();
			$data['pilihkategori'] = $this->m_admin->list_kategori()->result();
			$data['listsoal'] = '';
		}

		if($mapel) {
		 	$data['listsoal'] = $this->m_admin->soal_admin($pjk, $mapel, $kategori)->result();
		 }

		//Guru
		if($this->session->status == 'guru'){
			$data['pilihkategori'] = $this->m_admin->list_kategori()->result();
			$data['listsoal'] = $this->m_admin->soal_guru($this->session->id, $pjk, $kategori)->result();
		}

		$this->header($data);
		$this->load->view('soal');
		$this->load->view('template/footer');
	}

	function soal_by_mapel($kelas, $mapel){
		$soal = $this->db->query('SELECT * FROM soal WHERE kelas='.$kelas.' AND mapel='.$mapel)->result();
		$this->j($soal);
	}

	//Tambah Soal
	//Sebelum menambah soal, ubah settingan maximum file upload pada php.ini
	public function tambahsoal(){
		$data['title'] = 'Tambah Soal';
		$data['listmapel'] = $this->m_admin->list_mapel()->result();
		$data['listkelas'] = $this->m_admin->list_kelas()->result();
		$data['listguru'] = $this->m_admin->list_guru()->result();
		$data['listkategori'] = $this->m_admin->list_kategori()->result();

		$this->header($data);
		$this->load->view('tambahsoal');
		$this->load->view('template/footer');
	}

	public function get_kelas(){
		$kelas = $this->db->query("select id_kelas as value, kode_kelas as label from kelas")->result();
		echo json_encode($kelas);
	}

	//Aksi tambah soal
	function act_tsoal(){
		$mapel = $this->input->post('mapel');
		$kelas = $this->input->post('id_kelas');
		$guru = $this->input->post('guru');
		$soal = $this->input->post('soal');
		$kategori = $this->input->post('kategori');
		$nama_soal = $this->input->post('nama_soal');
		$a = $this->input->post('a');
		$b = $this->input->post('b');
		$c = $this->input->post('c');
		$d = $this->input->post('d');
		$e = $this->input->post('e');
		$jawaban = $this->input->post('jawaban');
		$cekmedia = $_FILES['media'];
		$split_kelas = explode(',', $kelas);

		for ($i = 0; $i < sizeof($split_kelas); $i++) {
			if($this->session->status == 'admin') {
				if (empty($cekmedia['name'])) {
					# code...
					$data = array(
						'mapel' => $mapel,
						'kelas' => $split_kelas[$i],
						'guru' => $guru,
						'soal' => $soal,
						'id_kategori' => $kategori,
						'nama_soal' => $nama_soal,
						'opsi_a' => $a,
						'opsi_b' => $b,
						'opsi_c' => $c,
						'opsi_d' => $d,
						'jawaban' => $jawaban
					);
					$this->m_admin->in_soal_nomedia('soal', $data);
			
				} else {
					$config['upload_path'] = './../media';
					$config['allowed_types'] = 'jpg|jpeg|png|gif|wav|mp3';
					//load library upload
					$this->load->library('upload', $config);
					$this->upload->initialize($config);

					//proses upload file
					if (!$this->upload->do_upload('media')) {
						$data['error'] = $this->upload->display_errors();
						var_dump($data['error']);
						redirect('tsoal', $data);
					}
					else{
						$media = $this->upload->data('file_name');
						$data = array(
							'mapel' => $mapel,
							'kelas' => $split_kelas[$i],
							'guru' => $guru,
							'soal' => $soal,
							'id_kategori' => $kategori,
							'nama_soal' => $nama_soal,					
							'media' => $media,
							'opsi_a' => $a,
							'opsi_b' => $b,
							'opsi_c' => $c,
							'opsi_d' => $d,
							'jawaban' => $jawaban
						);

						$this->m_admin->in_soal_media('soal', $data);	
					}
				}
			}
			if($this->session->status == 'guru') {
				if (empty($cekmedia['name'])) {
					# code...
					$data = array(
						'mapel' => $this->session->id_mapel,
						'kelas' => $split_kelas[$i],
						'guru' => $this->session->id,
						'soal' => $soal,
						'id_kategori' => $kategori,
						'nama_soal' => $nama_soal,
						'opsi_a' => $a,
						'opsi_b' => $b,
						'opsi_c' => $c,
						'opsi_d' => $d,
						'jawaban' => $jawaban
					);
					$this->m_admin->in_soal_nomedia('soal', $data);
			
				} else {
					$config['upload_path'] = './../media';
					$config['allowed_types'] = 'jpg|jpeg|png|gif|wav|mp3';
					//load library upload
					$this->load->library('upload', $config);
					$this->upload->initialize($config);

					//proses upload file
					if (!$this->upload->do_upload('media')) {
						$data['error'] = $this->upload->display_errors();
						var_dump($data['error']);
						redirect('tsoal', $data);
					}
					else{
						$media = $this->upload->data('file_name');
						$data = array(
							'mapel' => $this->session->id_mapel,
							'kelas' => $split_kelas[$i],
							'guru' => $this->session->id,
							'soal' => $soal,
							'id_kategori' => $kategori,
							'nama_soal' => $nama_soal,					
							'media' => $media,
							'opsi_a' => $a,
							'opsi_b' => $b,
							'opsi_c' => $c,
							'opsi_d' => $d,
							'jawaban' => $jawaban
						);

						$this->m_admin->in_soal_media('soal', $data);	
					}
				}					
			}			
		}
		$this->session->set_flashdata('soal', 'Soal berhasil ditambahkan');
		redirect('tsoal');
		
		//jika ada file
	}

	//Edit Soal
	public function esoal($id){
		$data['title'] = 'Edit Soal';
		$data['listmapel'] = $this->m_admin->list_mapel()->result();
		$data['listkelas'] = $this->m_admin->list_kelas()->result();
		$data['listguru'] = $this->m_admin->list_guru()->result();
		$data['listkategori'] = $this->m_admin->list_kategori()->result();
		$data['soal'] = $this->m_admin->get_soal_by_id(['id_soal' => $id])->row();

		$this->header($data);
		$this->load->view('editsoal');
		$this->load->view('template/footer');
	}

	//Aksi ediit soal
	function act_esoal($id){
		$mapel = $this->input->post('mapel');
		$kelas = $this->input->post('kelas');
		$guru = $this->input->post('guru');
		$soal = $this->input->post('soal');
		$kategori = $this->input->post('kategori');
		$nama_soal = $this->input->post('nama_soal');		
		$a = $this->input->post('a');
		$b = $this->input->post('b');
		$c = $this->input->post('c');
		$d = $this->input->post('d');
		$e = $this->input->post('e');
		$jawaban = $this->input->post('jawaban');
		$cekmedia = $_FILES['media'];

		$where = ['id_soal' => $id];
		//jika ada file
		if($this->session->status == 'admin') {
			if (empty($cekmedia['name'])) {
				# code...
				$data = array(
					'mapel' => $mapel,
					'kelas' => $kelas,
					'guru' => $guru,
					'soal' => $soal,
					'id_kategori' => $kategori,
					'nama_soal' => $nama_soal,				
					'opsi_a' => $a,
					'opsi_b' => $b,
					'opsi_c' => $c,
					'opsi_d' => $d,
					'jawaban' => $jawaban
				);
				$this->m_admin->up_soal_nomedia($where, 'soal', $data);
				$this->session->set_flashdata('soal', 'Soal berhasil diubah');
				redirect($this->agent->referrer());
			}
			else{
				$s = $this->db->query('select media from soal where id_soal='.$id)->row();
				unlink('./../media/'.$s->media);
				$config['upload_path'] = './../media';
				$config['allowed_types'] = 'jpg|png|gif|wav|mp3';
				//load library upload
				$this->load->library('upload', $config);

				//proses upload file
				if (!$this->upload->do_upload('media')) {
					$data['error'] = $this->upload->display_errors();
					redirect('tsoal', $data);
				}
				else{
					$media = $this->upload->data('file_name');
					$data = array(
						'mapel' => $mapel,
						'kelas' => $kelas,
						'guru' => $guru,
						'soal' => $soal,
						'id_kategori' => $kategori,
						'nama_soal' => $nama_soal,					
						'media' => $media,
						'opsi_a' => $a,
						'opsi_b' => $b,
						'opsi_c' => $c,
						'opsi_d' => $d,
						'jawaban' => $jawaban
					);

					$this->m_admin->up_soal_media($where, 'soal', $data);
					$this->session->set_flashdata('soal', 'Soal berhasil diubah');
					redirect($this->agent->referrer());
				}
			}
		}
		if($this->session->status == 'guru') {
			if (empty($cekmedia['name'])) {
				# code...
				$data = array(
					'mapel' => $this->session->id_mapel,
					'kelas' => $kelas,
					'guru' => $this->session->id,
					'soal' => $soal,
					'id_kategori' => $kategori,
					'nama_soal' => $nama_soal,				
					'opsi_a' => $a,
					'opsi_b' => $b,
					'opsi_c' => $c,
					'opsi_d' => $d,
					'jawaban' => $jawaban
				);
				$this->m_admin->up_soal_nomedia($where, 'soal', $data);
				$this->session->set_flashdata('soal', 'Soal berhasil diubah');
				redirect($this->agent->referrer());
			}
			else{
				$s = $this->db->query('select media from soal where id_soal='.$id)->row();
				unlink('./../media/'.$s->media);
				$config['upload_path'] = './../media';
				$config['allowed_types'] = 'jpg|png|gif|wav|mp3';
				//load library upload
				$this->load->library('upload', $config);

				//proses upload file
				if (!$this->upload->do_upload('media')) {
					$data['error'] = $this->upload->display_errors();
					redirect('tsoal', $data);
				}
				else{
					$media = $this->upload->data('file_name');
					$data = array(
						'mapel' => $this->session->id_mapel,
						'kelas' => $kelas,
						'guru' => $this->session->id,
						'soal' => $soal,
						'id_kategori' => $kategori,
						'nama_soal' => $nama_soal,					
						'media' => $media,
						'opsi_a' => $a,
						'opsi_b' => $b,
						'opsi_c' => $c,
						'opsi_d' => $d,
						'jawaban' => $jawaban
					);

					$this->m_admin->up_soal_media($where, 'soal', $data);
					$this->session->set_flashdata('soal', 'Soal berhasil diubah');
					redirect($this->agent->referrer());
				}
			}			
		}
	}

	//Hapus Soal
	function hapus_soal($id){
		$this->db->query("DELETE FROM soal WHERE id_soal=".$id);
		redirect($this->agent->referrer());
	}

	function laporan_bank_soal_sekolah() {
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Laporan Bank Soal Sekolah';
		$data['pilihkelas'] = $this->m_admin->list_kelas()->result();
		$data['pilihmapel'] = $this->m_admin->list_mapel()->result();
		$data['pilihkategori'] = $this->m_admin->list_kategori()->result();

		$this->header($data);
		$this->load->view('laporan_bank_sekolah');
		$this->load->view('template/footer');
	}

	function laporan_bank_soal_guru() {
		$data['title'] = 'Laporan Bank Soal Guru';
		$data['pilihkelas'] = $this->m_admin->list_kelas()->result();
		$data['pilihmapel'] = $this->m_admin->list_mapel()->result();
		$data['pilihkategori'] = $this->m_admin->list_kategori()->result();

		$this->header($data);
		$this->load->view('laporan_bank_guru');
		$this->load->view('template/footer');
	}

	public function cetak_soal_guru(){
		$mapel = $this->input->post('cetak-mapel');
		$kategori = $this->input->post('cetak-kategori');
		$kelas = $this->input->post('cetak-kelas');		
		$data['listsoal'] = $this->m_admin->cetak_soal_guru($this->session->id, $mapel, $kelas, $kategori)->result();

		$this->load->view('cetak_soal_guru', $data);
	}		

	public function cetak_soal_sekolah(){
		$mapel = $this->input->post('cetak-mapel');
		$kelas = $this->input->post('cetak-kelas');
		$kategori = $this->input->post('cetak-kategori');
		if($kelas != "" && $mapel == "" && $kategori == "") {
		 	$data['listsoal'] = $this->m_admin->cetak_soal_kelas($kelas)->result();
		 	$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_soal_kelas', $data);
		 } 
		 if($mapel != "" && $kelas == "" && $kategori == "") {
		 	$data['listsoal'] = $this->m_admin->cetak_soal_mapel($mapel)->result();
		 	$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
		 	$this->load->view('cetak_soal_mapel', $data);
		 }
		 if($kategori != "" && $kelas == "" && $mapel == "") {		 	
		 	$data['listsoal'] = $this->m_admin->cetak_soal_kategori($kategori)->result();
		 	$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
		 	$this->load->view('cetak_soal_kategori', $data);
		 }
		 if($kelas != "" && $mapel != "" && $kategori == "") {
		 	$data['listsoal'] = $this->m_admin->cetak_soal_kelas_mapel($kelas, $mapel)->result();
		 	$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
		 	$this->load->view('cetak_soal_kelas_mapel', $data);		 	
		 }
		 if($kelas != "" && $mapel != "" && $kategori != "") {
		 	$data['listsoal'] = $this->m_admin->cetak_soal_kelas_mapel_kategori($kelas, $mapel, $kategori)->result();
		 	$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
		 	$this->load->view('cetak_soal_kelas_mapel_kategori', $data);		 	
		 }

		 if($kelas == "" && $mapel == "" && $kategori == "") {
		 	$data['listsoal'] = $this->m_admin->cetak_soal_semua()->result();
		 	$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
		 	$this->load->view('cetak_soal_semua', $data);		 	
		 }			 		 
	}	
	
	public function laporan_nilai_raport_siswa()
	{
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Laporan Nilai Raport Siswa';
		$data['listkelas'] = $this->m_admin->list_kelas()->result();

		$this->header($data);
		$this->load->view('laporan_nilai_raport_siswa');
		$this->load->view('template/footer');
	}

	public function laporan_nilai_siswa_kelas()
	{
		$data['title'] = 'Laporan Nilai Siswa Kelas';
		$data['listkelas'] = $this->m_admin->list_kelas()->result();
		$data['listmapel'] = $this->m_admin->list_mapel()->result();

		$this->header($data);
		$this->load->view('laporan_nilai_siswa_kelas');
		$this->load->view('template/footer');
	}	

	public function laporan_nilai_siswa()
	{
		$data['title'] = 'Laporan Nilai Siswa';
		$data['listkelas'] = $this->m_admin->list_kelas()->result();

		$this->header($data);
		$this->load->view('laporan_nilai_siswa');
		$this->load->view('template/footer');
	}

	public function laporan_nilai_siswa_kelas_guru()
	{
		$data['title'] = 'Laporan Nilai Siswa Kelas Guru';
		$data['listkelas'] = $this->m_admin->list_kelas()->result();
		$data['listmapel'] = $this->m_admin->list_mapel()->result();

		$this->header($data);
		$this->load->view('laporan_nilai_siswa_kelas_guru');
		$this->load->view('template/footer');
	}

	function get_siswa_perkelas()
	{
		$kelas = $this->input->post('kelas');
		$data = $this->m_admin->list_siswa_perkelas($kelas)->result();
		echo json_encode($data);
	}

	public function cetak_nilai_siswa_kelas_guru() {
		$kelas = $this->input->post('cetak-kelas');
		$mapel = $this->input->post('cetak-mapel');
		$data['cetak_nilai_siswa'] = $this->m_admin->cetak_nilai_siswa_kelas_guru($kelas, $mapel);

		$this->load->view('cetak_nilai_siswa_kelas_guru', $data);
	}	

	//Nilai
	public function cetak_nilai_raport_siswa() {
		$kelas = $this->input->post('cetak-kelas');
		$data['cetak_nilai_raport'] = $this->m_admin->cetak_nilai_raport_siswa($kelas);
		$data['kepala_sekolah'] = $this->kepala_sekolah()->result();

		$this->load->view('cetak_nilai_raport', $data);
	}

	public function cetak_nilai_siswa_kelas() {
		$kelas = $this->input->post('cetak-kelas');
		$mapel = $this->input->post('cetak-mapel');
		$jenis = $this->input->post('cetak-jenis');
		$data['cetak_nilai_siswa'] = $this->m_admin->cetak_nilai_siswa_kelas($kelas, $mapel, $jenis);

		$this->load->view('cetak_nilai_siswa_kelas', $data);
	}

	public function cetak_nilai_siswa() {
		$kelas = $this->input->post('kelas');
		$siswa = $this->input->post('siswa');
		$data['cetak_nilai_siswa'] = $this->m_admin->cetak_nilai_siswa($kelas, $siswa);

		$this->load->view('cetak_nilai_siswa', $data);
	}	

	public function nilai($pjk){
		$mapel = $this->uri->segment(3);

		$vkelas = array('id_kelas' => $pjk);
		$data['kelas'] = $this->m_admin->vkelas($vkelas)->row_array();
		$data['kls'] = $data['kelas']['kode_kelas'];
		$data['title'] = 'Nilai '.$data['kelas']['kode_kelas'];
		$data['judul'] = 'Nilai';
		$data['listmapel'] = $this->m_admin->list_mapel()->result();
		$data['siswa'] = $this->m_admin->list_siswa_perkelas($pjk)->result();
		$data['nilai'] = '';

		if ($mapel) {
			$m = $this->db->query('SELECT mapel FROM mapel WHERE id_mapel='.$mapel)->row_array();
			$data['judul'] = 'Nilai '.$m['mapel'];
			$data['title'] = 'Nilai '.$m['mapel'].' '.$data['kelas']['kode_kelas'];
			$data['nilai'] = $this->nilai_by_mapel($pjk, $mapel)->result();
		}

		$this->header($data);
		$this->load->view('nilai');
		$this->load->view('template/footer');
	} 

	function nilai_by_mapel($kelas, $mapel){
		return $this->db->query(
			"SELECT s.nis, s.nama, m.mapel, s.id_siswa, 
				(SELECT ikut_ujian.nilai
					FROM ujian 
					JOIN ikut_ujian ON ujian.id_ujian = ikut_ujian.id_ujian 
					JOIN siswa ON ikut_ujian.id_siswa = siswa.id_siswa
					WHERE siswa.id_siswa = s.id_siswa AND ujian.nama_ujian = 'Ulangan-1' AND ujian.id_mapel = '$mapel') AS ulangan_1,
				(SELECT ikut_ujian.nilai
					FROM ujian 
					JOIN ikut_ujian ON ujian.id_ujian = ikut_ujian.id_ujian 
					JOIN siswa ON ikut_ujian.id_siswa = siswa.id_siswa
					WHERE siswa.id_siswa = s.id_siswa AND ujian.nama_ujian = 'Ulangan-2' AND ujian.id_mapel = '$mapel') AS ulangan_2,
				(SELECT ikut_ujian.nilai
					FROM ujian 
					JOIN ikut_ujian ON ujian.id_ujian = ikut_ujian.id_ujian 
					JOIN siswa ON ikut_ujian.id_siswa = siswa.id_siswa
					WHERE siswa.id_siswa = s.id_siswa AND ujian.nama_ujian = 'Ulangan-3' AND ujian.id_mapel = '$mapel') AS ulangan_3,
				(SELECT ikut_ujian.nilai
					FROM ujian 
					JOIN ikut_ujian ON ujian.id_ujian = ikut_ujian.id_ujian 
					JOIN siswa ON ikut_ujian.id_siswa = siswa.id_siswa
					WHERE siswa.id_siswa = s.id_siswa AND ujian.nama_ujian = 'UTS' AND ujian.id_mapel = '$mapel') AS uts,									
				(SELECT ikut_ujian.nilai
					FROM ujian 
					JOIN ikut_ujian ON ujian.id_ujian = ikut_ujian.id_ujian 
					JOIN siswa ON ikut_ujian.id_siswa = siswa.id_siswa
					WHERE siswa.id_siswa = s.id_siswa AND ujian.nama_ujian = 'UAS' AND ujian.id_mapel = '$mapel') AS uas						
			FROM siswa s
			JOIN ikut_ujian iu ON iu.id_siswa = s.id_siswa
			JOIN ujian u ON iu.id_ujian = u.id_ujian
			JOIN mapel m ON u.id_mapel = m.id_mapel
			WHERE u.id_kelas = '$kelas' AND m.id_mapel = '$mapel' GROUP BY s.nis");

	}

	function hapus_nilai($id){
		$this->db->query('DELETE FROM ikut_ujian WHERE id_tes='.$id);
		redirect($this->agent->referrer());
	}

	//Ujian
	public function ujian(){
		$data['title'] = 'Ujian';
		$data['listkelas'] = $this->m_admin->list_kelas()->result();
		$data['listguru'] = $this->m_admin->list_guru()->result();
		$data['listujian'] = $this->m_admin->list_ujian()->result();

		$this->header($data);
		$this->load->view('ujian');
		$this->load->view('template/footer');
	}

	function mapel_by_kelas($id){
		$mapel = $this->db->query('SELECT mapel.* FROM mapel, soal WHERE soal.mapel=mapel.id_mapel AND soal.mapel=mapel.id_mapel AND soal.kelas='.$id.' GROUP BY mapel')->result();
		echo json_encode($mapel);
	}

	function tambah_ujian(){
		$ujian = $this->input->post('nmujian');
		$kelas = $this->input->post('kelas');
		$mapel = $this->input->post('mapel');
		$guru = $this->input->post('guru');
		$waktu = $this->input->post('waktu');
		$jumlah = $this->input->post('jumlah');
		$tanggal_mulai = date('Y-m-d H:i:s', strtotime($this->input->post('tanggal_mulai').$this->input->post('jam_mulai')));
		$tanggal_selesai = date('Y-m-d H:i:s', strtotime("+" . $waktu . "minutes", strtotime($tanggal_mulai)));		
		$data = [
			'nama_ujian' => $ujian,
			'id_kelas' => $kelas,
			'id_mapel' => $mapel,
			'id_guru' => $guru,
			'waktu' => $waktu,
			'tanggal_mulai' => $tanggal_mulai,
			'tanggal_selesai' => $tanggal_selesai,
			'jumlah_soal' => $jumlah
		];

		$this->m_admin->t_ujian("ujian", $data);
		$this->session->set_flashdata('t_ujian', '');		
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('add', 'Ujian berhasil ditambahkan');
        }		
		redirect('ujian');
	}

	function edit_ujian($id_ujian){
		$ujian = $this->input->post('nmujian');
		$kelas = $this->input->post('kelas');
		$mapel = $this->input->post('mapel');
		$guru = $this->input->post('guru');
		$waktu = $this->input->post('waktu');
		$jumlah = $this->input->post('jumlah');
		$tanggal_mulai = date('Y-m-d H:i:s', strtotime($this->input->post('tanggal_mulai').$this->input->post('jam_mulai')));
		$tanggal_selesai = date('Y-m-d H:i:s', strtotime("+" . $waktu . "minutes", strtotime($tanggal_mulai)));
		$jam = $this->input->post('jam');
		$where = ['id_ujian' => $id_ujian];
		$data = [
			'nama_ujian' => $ujian,
			'id_kelas' => $kelas,
			'id_mapel' => $mapel,
			'id_guru' => $guru,
			'waktu' => $waktu,
			'tanggal_mulai' => $tanggal_mulai,
			'tanggal_selesai' => $tanggal_selesai,
			'jumlah_soal' => $jumlah
		];

		$this->m_admin->e_ujian($where, 'ujian', $data);
		$this->session->set_flashdata('t_ujian', '');
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('edit', 'Ujian berhasil diubah');
        }		
		redirect('ujian');
	}

	function hapus_ujian($id){
		$this->db->query("DELETE FROM ujian WHERE id_ujian=".$id);
		if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('delete', 'Ujian berhasil dihapus');
        }
		redirect($this->agent->referrer());
	}

	public function laporan_ujian() {
		if($this->session->status != 'admin'){
			redirect('');
		}

		$data['title'] = 'Laporan Ujian';

		$this->header($data);
		$this->load->view('laporan_ujian');
		$this->load->view('template/footer');
	}		

	public function cetak_ujian(){
		if($this->session->status != 'admin'){
			redirect('');
		}		

		$bulan = $this->input->post('cetak-bulan');
		$tahun = $this->input->post('cetak-tahun');
		if($bulan != "" && $tahun == "") {
			$data['cetak'] = $this->m_admin->cetak_ujian_bulan($bulan)->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_ujian_bulan', $data);
		}

		if($tahun != "" && $bulan == "") {
			$data['cetak'] = $this->m_admin->cetak_ujian_tahun($tahun)->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_ujian_tahun', $data);
		}

		if($bulan != "" && $tahun != "") {
			$data['cetak'] = $this->m_admin->cetak_ujian_bulan_tahun($bulan, $tahun)->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_ujian_bulan_tahun', $data);
		}

		if($bulan == "" && $tahun == "") {
			$data['cetak'] = $this->m_admin->list_ujian()->result();
			$data['kepala_sekolah'] = $this->kepala_sekolah()->result();
			$this->load->view('cetak_ujian_semua', $data);
		}							
	}	

	//Setting
	public function setting(){
		if ($this->session->status == 'admin') {
			$data['admin'] = $this->db->query('SELECT id_admin, nama, nip, jabatan, username FROM admin')->result();
		}
		$data['title'] = 'Pengaturan';

		$this->header($data);
		$this->load->view('setting');
		$this->load->view('template/footer');
	}

	function ganti_passwd_admin(){
		$password = $this->input->post('password');
		$passwordbaru = $this->input->post('passwordbaru');

		$id = ['id_admin' => $this->session->id];
		$cek = $this->m_admin->cek_passwd_admin($id)->row();
		if (password_verify($password, $cek->password)) {
			# code...
			$pb = password_hash($passwordbaru, PASSWORD_DEFAULT);
			$data = ['password' => $pb];
			$this->m_admin->update_passwd('admin', $data, $id);
			$this->session->set_flashdata('passwd', 'Password berhasil diubah');
			redirect('setting');
		}
		else{
			$this->session->set_flashdata('error', 'Password lama salah !');
			redirect('setting');
		}
	}

	function ganti_passwd_guru(){
		$password = $this->input->post('password');
		$passwordbaru = $this->input->post('passwordbaru');
		$where = ['id_guru' => $this->session->id];
		$cek = $this->m_admin->cek_passwd_guru($where)->row();
		if ($password == $cek->password) {
			$data = ['password' => $passwordbaru];
			$this->m_admin->update_passwd('guru', $data, $where);
			$this->session->set_flashdata('passwd', 'Password berhasil diubah');
			redirect('setting');
		}
		else{
			$this->session->set_flashdata('error', 'Password lama salah !');
			redirect('setting');
		}
	}

	function ganti_user(){
		$id = $this->session->id;
		$nama = $this->input->post('nama');
		$nip = $this->input->post('nip');
		$jabatan = $this->input->post('jabatan');
		$username = $this->input->post('username');
		$data = ['nama' => $nama,'nip' => $nip , 'jabatan' => $jabatan, 'username' => $username];
		if ($this->session->status == 'admin') {
			$where = ['id_admin' => $id];
			$this->m_admin->update_passwd('admin', $data, $where);

			$this->session->unset_userdata(['nama', 'nip', 'jabatan', 'username']);
			$this->session->set_userdata($data);

			$this->session->set_flashdata('passwd', 'Nama/Username berhasil diubah');
			redirect('setting');
		}
		if ($this->session->status == 'guru') {
			$where = ['id_guru' => $id];
			$this->m_admin->update_passwd('guru', $data, $where);

			$this->session->unset_userdata(['nama','username']);
			$this->session->set_userdata($data);

			$this->session->set_flashdata('passwd', 'Nama/Username berhasil diubah');
			redirect('setting');
		}
	}

	function tambah_admin(){
		$nama = $this->input->post('nama');
		$nip = $this->input->post('nip');
		$jabatan = $this->input->post('jabatan');
		$username = $this->input->post('username');
		$password = password_hash($this->input->post('password'), PASSWORD_DEFAULT);
		$data = ['nama' => $nama, 'nip' => $nip, 'jabatan' => $jabatan, 'username' => $username, 'password' => $password];
		$this->db->insert('admin', $data);
		$this->session->set_flashdata('tambahadmin', $nama.' berhasil ditambahkan sebagai admin');
		redirect('setting');
	}
	
	function hapus_admin($id){
		$this->db->query('DELETE FROM admin WHERE id_admin='.$id);
		redirect('setting');
	}

	//Reset aplikasi
	function teser(){
		$this->db->query('SET FOREIGN_KEY_CHECKS = 0');
		$this->db->truncate('guru');
		$this->db->truncate('ikut_ujian');
		$this->db->truncate('kelas');
		$this->db->truncate('mapel');
		$this->db->truncate('siswa');
		$this->db->truncate('soal');
		$this->db->truncate('ujian');
		$this->db->truncate('kategori');
		$this->db->query('SET FOREIGN_KEY_CHECKS = 1');
		delete_files('./../media/');
		redirect('');
	}

	//Error 404
	public function error(){
		$data['title'] = '404 Not Found';

		$this->header($data);
		$this->load->view('template/404');
		$this->load->view('template/footer');
	}

	function j($data){
		header('Content-Type: application/json');
		echo json_encode($data);
	}
}
