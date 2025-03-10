(function ($) {
  var cocoon_element_counter = 0;

  var create_new_id = function () {
    return new Date().getTime() + cocoon_element_counter++;
  };

  var newcontent_braced = function (id) {
    return "[" + id + "]$1";
  };

  var newcontent_underscord = function (id) {
    return "_" + id + "_$1";
  };

  var getInsertionNodeElem = function (
    insertionNode,
    insertionTraversal,
    $this
  ) {
    if (!insertionNode) {
      return $this.parent();
    }

    if (typeof insertionNode == "function") {
      if (insertionTraversal) {
        console.warn(
          "association-insertion-traversal is ignored, because association-insertion-node is given as a function."
        );
      }
      return insertionNode($this);
    }

    if (typeof insertionNode == "string") {
      if (insertionTraversal) {
        return $this[insertionTraversal](insertionNode);
      } else {
        return insertionNode == "this" ? $this : $(insertionNode);
      }
    }
  };

  $(document).on("click", ".add_fields", function (e) {
    e.preventDefault();
    var $this = $(this),
      assoc = $this.data("association"),
      assocs = $this.data("associations"),
      content = $this.data("association-insertion-template"),
      insertionMethod =
        $this.data("association-insertion-method") ||
        $this.data("association-insertion-position") ||
        "before",
      insertionNode = $this.data("association-insertion-node"),
      insertionTraversal = $this.data("association-insertion-traversal"),
      count = parseInt($this.data("count"), 10),
      regexp_braced = new RegExp("\\[new_" + assoc + "\\](.*?\\s)", "g"),
      regexp_underscord = new RegExp("_new_" + assoc + "_(\\w*)", "g"),
      new_id = create_new_id(),
      new_content = content.replace(regexp_braced, newcontent_braced(new_id)),
      new_contents = [];

    if (new_content == content) {
      regexp_braced = new RegExp("\\[new_" + assocs + "\\](.*?\\s)", "g");
      regexp_underscord = new RegExp("_new_" + assocs + "_(\\w*)", "g");
      new_content = content.replace(regexp_braced, newcontent_braced(new_id));
    }

    new_content = new_content.replace(
      regexp_underscord,
      newcontent_underscord(new_id)
    );
    new_contents = [new_content];

    count = isNaN(count) ? 1 : Math.max(count, 1);
    count -= 1;

    while (count) {
      new_id = create_new_id();
      new_content = content.replace(regexp_braced, newcontent_braced(new_id));
      new_content = new_content.replace(
        regexp_underscord,
        newcontent_underscord(new_id)
      );
      new_contents.push(new_content);

      count -= 1;
    }

    var insertionNodeElem = getInsertionNodeElem(
      insertionNode,
      insertionTraversal,
      $this
    );

    if (!insertionNodeElem || insertionNodeElem.length == 0) {
      console.warn(
        "Couldn't find the element to insert the template. Make sure your `data-association-insertion-*` on `link_to_add_association` is correct."
      );
    }

    $.each(new_contents, function (i, node) {
      var contentNode = $(node);

      var before_insert = jQuery.Event("cocoon:before-insert");
      insertionNodeElem.trigger(before_insert, [contentNode]);

      if (!before_insert.isDefaultPrevented()) {
        // allow any of the jquery dom manipulation methods (after, before, append, prepend, etc)
        // to be called on the node.  allows the insertion node to be the parent of the inserted
        // code and doesn't force it to be a sibling like after/before does. default: 'before'
        var addedContent = insertionNodeElem[insertionMethod](contentNode);

        insertionNodeElem.trigger("cocoon:after-insert", [contentNode]);
      }
    });
  });

  $(document).on(
    "click",
    ".remove_fields.dynamic, .remove_fields.existing",
    function (e) {
      var $this = $(this),
        wrapper_class = $this.data("wrapper-class") || "nested-fields",
        node_to_delete = $this.closest("." + wrapper_class),
        trigger_node = node_to_delete.parent();

      e.preventDefault();

      var before_remove = jQuery.Event("cocoon:before-remove");
      trigger_node.trigger(before_remove, [node_to_delete]);

      if (!before_remove.isDefaultPrevented()) {
        var timeout = trigger_node.data("remove-timeout") || 0;

        setTimeout(function () {
          if ($this.hasClass("dynamic")) {
            node_to_delete.detach();
          } else {
            $this.prev("input[type=hidden]").val("1");
            node_to_delete.hide();
          }
          trigger_node.trigger("cocoon:after-remove", [node_to_delete]);
        }, timeout);
      }
    }
  );

  // $(document).on("ready page:load turbolinks:load", function () {
  //   $('.remove_fields.existing.destroyed').each(function (i, obj) {
  //     var $this = $(this),
  //       wrapper_class = $this.data('wrapper-class') || 'nested-fields';

  //     $this.closest('.' + wrapper_class).hide();
  //   });
  // });

  $(document).ready(function () {
    $(".nestedData").on("cocoon:after-insert", function (e, insertedItem) {
      function readURL(input, id) {
        if (input.files && input.files[0]) {
          let reader = new FileReader();

          reader.onload = function (e) {
            // console.log("#photo-field-"+id)
            $("#photo-field-" + id).attr("src", e.target.result);
          };

          reader.readAsDataURL(input.files[0]);
        }
      }
      insertedItem
        .children()
        .children()
        .children()
        .children()
        .children()
        .children()
        .children(".hidden_stars")
        .attr(
          "id",
          "social_proof_testimonials_attributes_" + e.timeStamp + "_stars"
        );
      insertedItem
        .children()
        .children()
        .children()
        .children()
        .children()
        .children()
        .children(".photo-field")
        .attr("id", "photo-field-" + e.timeStamp);
      insertedItem
        .children()
        .children()
        .children()
        .children()
        .children()
        .children()
        .children()
        .children(".photo-field-input")
        .attr("id", "photo-field-input-" + e.timeStamp);
      insertedItem
        .children()
        .children()
        .children()
        .children()
        .children()
        .children()
        .children(".star-icon")
        .each((index, element) => {
          let new_id = $(element).attr("id").split("_").slice(0, -1);
          $(element).attr("id", new_id.join("_") + "_" + e.timeStamp);
          $(element).addClass("stars-icon-" + e.timeStamp);
        });

      $(".photo-field-input").change(function () {
        const id = $(this).attr("id").replace("photo-field-input-", "");
        readURL(this, id);
      });

      $(".star-icon").on("click", function () {
        let id = this.id;
        let group = id.split("_")[id.split("_").length - 1];
        $(".stars-icon-" + group).each((index, element) => {
          $(element).addClass("mdi-star-outline");
          $(element).removeClass("mdi-star");
        });
        $(".stars-icon-" + group).each((index, element) => {
          $(element).addClass("mdi-star");
          $(element).removeClass("mdi-star-outline");
          if (element.id == id) {
            $("#social_proof_testimonials_attributes_" + group + "_stars").val(
              index + 1
            );
            return false;
          }
        });
      });

      $(".star-icon").on("mouseover", function () {
        let id = this.id;
        let group = id.split("_")[id.split("_").length - 1];
        // let group = id.slice(id.length-1)
        $(".stars-icon-" + group).each((index, element) => {
          // console.log(element)
          $(element).addClass("mdi-star-outline");
          $(element).removeClass("mdi-star");
        });
        $(".stars-icon-" + group).each((index, element) => {
          $(element).addClass("mdi-star");
          $(element).removeClass("mdi-star-outline");
          if (element.id == id) {
            $("#social_proof_testimonials_attributes_" + group + "_stars").val(
              index + 1
            );
            return false;
          }
        });
      });
    });
  });
})(jQuery);
