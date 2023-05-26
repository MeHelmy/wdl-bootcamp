version 1.0
workflow samtoolsIdxstats {
  input {
    File bamfile
  }
  call idxstats {
    input:
      bamfile = bamfile
  }
  output {
    File results = idxstats.idxstats
  }
}

task idxstats {
  input {
    File bamfile
  }
  command <<<
    samtools index ~{bamfile}
    samtools idxstats ~{bamfile} > idxstats.txt
  >>>
  output {
    File idxstats = "idxstats.txt"
  }
  runtime {
    docker: 'ekiernan/wdl-101:v1'
  }
}
