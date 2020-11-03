<?php
class Tccxattr_model extends \Model
{

    public function __construct($serial = '')
    {
        parent::__construct('id', 'tccxattr'); //primary key, tablename
        $this->rs['id'] = '';
        $this->rs['serial_number'] = $serial;
        $this->rs['status'] = '';

        if ($serial) {
            $this->retrieve_record($serial);
        }

        $this->serial = $serial;
    }

    /**
     * Process data sent by postflight
     *
     * @param string data
     **/
    public function process($text)
    {
        // Nuke previous data
        $this->deleteWhere('serial_number=?', $this->serial_number);

        $this->rs['id'] = '';
        $this->rs['status'] = $text;
        $this->save();
    }
}
