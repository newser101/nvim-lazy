return{
"nvim-treesitter/nvim-treesitter",
build=function ()
  require("nvim-treesitter.install").update({with_sync=true})
end,


------ minimum setup BEGINN -------
config =function ()
  require("nvim-treesitter.configs").setup{
    ensure_installed="lua",
    sync_installed=false,
    highlight={
      enable=false,
    }
  }
end
------ minimum setup END -------

}
