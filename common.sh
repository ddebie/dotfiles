make_link()
{
  case "$OSTYPE" in
    darwin*)  
      ln -s $1 $2
    ;; 
    linux*)   
      ln -s $1 $2
    ;;
    *)
      echo "make_link() unimplemented OS: $OSTYPE"
      exit 1
    ;;
  esac
}
