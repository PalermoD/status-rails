module MicropostsHelper

    def add_links(text)
        Rinku.auto_link(text).html_safe
    end

end
