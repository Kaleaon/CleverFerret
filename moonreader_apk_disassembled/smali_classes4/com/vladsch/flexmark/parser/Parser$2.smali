.class final Lcom/vladsch/flexmark/parser/Parser$2;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/DataValueFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
        "Ljava/util/List<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 135
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$2;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/util/List;
    .locals 65
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 138
    const-string v63, "track"

    const-string v64, "ul"

    const-string v1, "address"

    const-string v2, "article"

    const-string v3, "aside"

    const-string v4, "base"

    const-string v5, "basefont"

    const-string v6, "blockquote"

    const-string v7, "body"

    const-string v8, "caption"

    const-string v9, "center"

    const-string v10, "col"

    const-string v11, "colgroup"

    const-string v12, "dd"

    const-string v13, "details"

    const-string v14, "dialog"

    const-string v15, "dir"

    const-string v16, "div"

    const-string v17, "dl"

    const-string v18, "dt"

    const-string v19, "fieldset"

    const-string v20, "figcaption"

    const-string v21, "figure"

    const-string v22, "footer"

    const-string v23, "form"

    const-string v24, "frame"

    const-string v25, "frameset"

    const-string v26, "h1"

    const-string v27, "h2"

    const-string v28, "h3"

    const-string v29, "h4"

    const-string v30, "h5"

    const-string v31, "h6"

    const-string v32, "head"

    const-string v33, "header"

    const-string v34, "hr"

    const-string v35, "html"

    const-string v36, "iframe"

    const-string v37, "legend"

    const-string v38, "li"

    const-string v39, "link"

    const-string v40, "main"

    const-string v41, "math"

    const-string v42, "menu"

    const-string v43, "menuitem"

    const-string v44, "meta"

    const-string v45, "nav"

    const-string v46, "noframes"

    const-string v47, "ol"

    const-string v48, "optgroup"

    const-string v49, "option"

    const-string v50, "p"

    const-string v51, "param"

    const-string v52, "section"

    const-string v53, "source"

    const-string v54, "summary"

    const-string v55, "table"

    const-string v56, "tbody"

    const-string v57, "td"

    const-string v58, "tfoot"

    const-string v59, "th"

    const-string v60, "thead"

    const-string v61, "title"

    const-string v62, "tr"

    filled-new-array/range {v1 .. v64}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
