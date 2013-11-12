module CategoriesHelper

  def category_meth
    Category.all.map { |c| [c.name, c.id]  }
  end

  def build_tree()
    html = ""
    Category.root().each do |roots|
      html<< "\t<ul>\n"
      html<< "\t\t<li>\n"
      html<< "\t\t\t<span> <i  class='icon-folder-open'></i> #{roots.name}</span> <a href="">Padre</a>\n"
      html_son = ""
      html = html+ build_son(roots,html_son)
      html<< "\t\t</li>\n"
      html<< "\t</ul>\n"
    end
    puts(html)
    html
  end

  def build_son(father, html)
      html<< "\t<ul>\n"
      father.referrals.each do |son|
        if son.referrals.empty?
          html<< "\t\t<li>\n"
          html<< "\t\t\t<span> <i class= 'icon-leaf'></i> #{son.name}</span> <a href="">Goes somewhere</a>\n"
          html<< "\t\t</li>\n"
        else
          html<< "\t\t<li>\n"
          html<< "\t\t\t<span> <i class= 'icon-minus-sign'></i> #{son.name}</span> <a href="">Goes somewhere</a>\n"
          html_son = ""
          html= html +  build_son(son,html_son)
          html<< "\t\t</li>\n"
        end
      end
      html<< "\t</ul>\n"
      return html
  end


end
