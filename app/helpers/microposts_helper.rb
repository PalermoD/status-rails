module MicropostsHelper

    def add_links(text)
        Rinku.auto_link(text, :all, 'target="_blank"').html_safe
    end

end
