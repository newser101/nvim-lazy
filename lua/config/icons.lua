local icons = {
  ---- restart icons BEGINN  -----

  ---- nvimtree BEGINN ----
  nvimtree = {
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      untracked = "U",
      deleted = "",
      ignored = "◌",
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  ---- nvimtree END ----

  -- lualine BEGIN --
  lualine = {
    diagnostic_symbols = {
      error = " ",
      warn = " ",
      info = "",
      hint = " ",
    },
    diff = {
      added = " ",
      modified = " ",
      removed = " ",
    },
  },
  -- lualine END --

  -- cmp BEGINN
  cmp = {
    kind_icons = {
      Text = "",
      Method = "m",
      Function = "󰡱",
      Constructor = "",
      Field = "",
      Variable = "󰫧",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "  ",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰇽",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
      Codeium = "󰚩",
      Copilot = "",
    },
  },
  -- cmp END
  -- trouble BEGINN
  trouble = {
    signs = {
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
  },
  -- trouble END
  ---- restart icons END  -----
  git = {
    LineAdded = "",
    LineModified = "",
    LineRemoved = "",
    FileDeleted = "",
    FileIgnored = "◌",
    FileRenamed = "",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
    Diff = "",
    Repo = "",
    Octoface = "",
    Branch = "",
  },
  gitsigns = {
    add = { text = "" },
    change = { text = "" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },

  ui = {
    ArrowCircleDown = "",
    ArrowCircleLeft = "",
    ArrowCircleRight = "",
    ArrowCircleUp = "",
    BoldArrowDown = "",
    BoldArrowLeft = "",
    BoldArrowRight = "",
    BoldArrowUp = "",
    BoldClose = "",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BookMark = "",
    BoxChecked = "",
    Bug = "",
    Stacks = "",
    Scopes = "",
    Watches = "󰂥",
    DebugConsole = "",
    Calendar = "",
    Check = "",
    ChevronRight = ">",
    ChevronShortDown = "",
    ChevronShortLeft = "",
    ChevronShortRight = "",
    ChevronShortUp = "",
    Circle = "",
    Close = "󰅖",
    CloudDownload = "",
    Code = "",
    Comment = "",
    Dashboard = "",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "»",
    Ellipsis = "",
    EmptyFolder = "",
    EmptyFolderOpen = "",
    File = "",
    FileSymlink = "",
    Files = "",
    FindFile = "󰈞",
    FindText = "󰊄",
    Fire = "",
    Folder = "󰉋",
    FolderOpen = "",
    FolderSymlink = "",
    Forward = "",
    Gear = "",
    History = "",
    Lightbulb = "",
    LineLeft = "▏",
    LineMiddle = "│",
    List = "",
    Lock = "",
    NewFile = "",
    Note = "",
    Package = "",
    Pencil = "󰏫",
    Plus = "",
    Project = "",
    Search = "",
    SignIn = "",
    SignOut = "",
    Tab = "󰌒",
    Table = "",
    Target = "󰀘",
    Telescope = "",
    Text = "",
    Tree = "",
    Triangle = "󰐊",
    TriangleShortArrowDown = "",
    TriangleShortArrowLeft = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp = "",
  },
  diagnostics = {
    BoldError = "",
    Error = "",
    BoldWarning = "",
    Warning = "",
    BoldInformation = "",
    Information = "",
    BoldQuestion = "",
    Question = "",
    BoldHint = "",
    Hint = "󰌶",
    Debug = "",
    Trace = "✎",
  },
  misc = {
    Robot = "󰚩",
    Squirrel = "",
    Tag = "",
    Watch = "",
    Smiley = "",
    Package = "",
    CircuitBoard = "",
  },
}
return icons
