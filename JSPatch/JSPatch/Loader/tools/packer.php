<?php 

const PRIVATE_KEY = <<<EOD
//-----BEGIN RSA PRIVATE KEY-----
//MIICXwIBAAKBgQC+1xcYsEE+ab/Ame1/HHAgfBRhD67I9mBYCiOJqC3lJX5RKFvt
//OTcF5Sf5Bz3NL/2QWPLu40+yt4EvjZ3HOUAHrVgo2Fjo4vpaRoEaEtaccOziPH/A
//SScOfL+uppNGOa0glTCZLKVZI3Go8zoutr8VDw2dNT7rDM/4TvPjwMYd3QIDAQAB
//AoGBAL7C9n1hQfaHcnut4i8bWCHApgZXzNlpHekjSV7C1A2oKtopQ6qfdJbZ99kA
//GhDPFeGCaGPOqM32jJXiM4L/gTXxdaZMlthVgxQRqrnGkh4NqPQLAYo0qgb21TsY
//RE2BXdSET1E8WbGWjZ4508Jx6TNtTaSJJlgsSnqVibJHAEyBAkEA3i/+jif6KKVm
//Q0aS0TJIPCOjp2fmBfke27j/BdC2wJ5Arp1VO+sgKM8qJqaoOUCv+z08WGyIostF
//oOfRiGF9DQJBANvh3WQkbIjAgVrWoasHI54S7lz8kkeqKJ30LdIUK/1I9+rf3iy5
//YvSmrnH4VnTx4XfxemKfF+HQNnlqcf1sEBECQQCbidGTRl0S0yaRdfgVRjPXFcPc
//zxjxmYGGoyyzr3YfxSjWlAE03tY2ez+wqv4chjIrmKSD6gaEn/PwPhgqdsSJAkEA
//nRoW3ZsstNSeV7Hsls8mAqZSCrwnI+8O0DSLnILvHyxIfldvXZMjgdup3iJqW2oL
//B3DQWbCEFsJ2eW+1fDT+kQJBANUUbnJNJtrUMK013eEIWwgXLk7cnJ71CkhtnVUP
//6sK44uktZ2a6YSkpmcRPgniy6McUR8g58ZgMeXn5OUv91lU=
//-----END RSA PRIVATE KEY-----
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQDsZCm60ZSwMSd1/zN6eomrZ3gko/WFhBrZg3/zyYin91kxahlq
MPD+OL7YGq1zpvp/HxDFInpL8iB9yIBlOE1oLkr45TPEe03H96CsVXtns7bl/X7w
7tQ7pZooUFvZ7KYUx5m9P/egTcETTKpNDbZA9ew0zz8DJp6Me+ENO+HQQwIDAQAB
AoGAJkqzV8fLRh8wPTTxqc1fr5w7IfRNOSuFDeb3Ow5STKMMl6yQIVt8LjIS9/6a
SjmqKh1mIgjLtrGqAbYQ1lSgdQgTV5Gf5Z659kW9bp61KW1JSxHH/4hfQ+Ppkg+b
C5QTQT9y7o4caKo69CWXMGDJnR6OUzM3u8UKl4cD53P1kIECQQD7U566GLB9cU9T
ZaERiKICZhCZIm//l7bE+i+hLzcW830zLQRpAHm4ex7gEBUfbk8lrIXi5xQFFVbQ
BPFsEPLZAkEA8MlyWyeiyG73lnG6JAajrinbGvqp0ugcoECG1dPRWUtySB83wObI
R6I1OyKoyZQyb7Ugg4TodOpUTmfRKAzyewJBAJH8fJK0jLARBXb37Zt1tkWWa8XH
zy60PaIlgU0rU+CtBuiXGZy0ff++5KxaKyratHa5w/uNJn/daVPjyyhun+ECQGXc
EjBVmBtKNhrCiYfr9xoaQsIq/+RkpJd2NJQIQyuPKw0vh5pnBpqnF/WoN9buhleT
O+nnM58h8gApEuXqdDkCQDGyLVpWvYa2djv2XHMibFIi3R2m3xemzZCY/g7hZVbv
U9wLHA+3f8UZCED+JqZ2TrS8fhrAe1ZqJ2sPoxhlDJE=
-----END RSA PRIVATE KEY-----
EOD;

$files = "";
$zipFile = "script.zip";
$finalFile = "v1";
for ($i = 1; $i < count($argv); $i ++) {
    if ($argv[$i] == '-o') {
        $finalFile = $argv[$i + 1];
        break;
    }
    $files .= $argv[$i] . " ";
}

if (!empty($files)) {

    //compress files
    echo system("zip $zipFile $files"); 

    //get and encrypt zip file's md5
    $zipFileMD5 = md5_file($zipFile);
    $private_key = openssl_pkey_get_private(PRIVATE_KEY);
    $ret = openssl_private_encrypt($zipFileMD5, $encrypted, $private_key);

    if (!$ret || empty($encrypted)) {
        unlink($zipFile);
        echo "fail to encrypt file md5";
    }

    $md5File = "key";
    file_put_contents($md5File, $encrypted);

    //pack script zip file and md5 file to final zip file
    echo system("zip $finalFile $zipFile $md5File"); 

    unlink($md5File);
    unlink($zipFile);
}
