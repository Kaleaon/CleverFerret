.class public Lcom/flyersoft/books/Md;
.super Lcom/flyersoft/books/BaseEBook;
.source "Md.java"


# static fields
.field private static final BLOCKQUOTE_:Ljava/lang/String; = "<div style=\"font-style: italic; border-left: 6px solid #bbbbbb; color:gray; margin-top: 1em; margin-bottom: 1em; padding-top:1em; padding-bottom:0em; padding-left: 2em; padding-right: 2em;\">"

.field private static final EXTENSIONS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/builder/Extension;",
            ">;"
        }
    .end annotation
.end field

.field private static final PRE_:Ljava/lang/String; = "<pre style=\"border: 1px solid #888888; padding: 1em\">"


# instance fields
.field filename:Ljava/lang/String;

.field imageFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field sourceHtml:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x7

    .line 167
    new-array v0, v0, [Lcom/vladsch/flexmark/util/builder/Extension;

    const/4 v1, 0x0

    .line 178
    invoke-static {}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->create()Lcom/vladsch/flexmark/util/builder/Extension;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 179
    invoke-static {}, Lcom/vladsch/flexmark/ext/autolink/AutolinkExtension;->create()Lcom/vladsch/flexmark/util/builder/Extension;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 180
    invoke-static {}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->create()Lcom/vladsch/flexmark/util/builder/Extension;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 181
    invoke-static {}, Lcom/vladsch/flexmark/superscript/SuperscriptExtension;->create()Lcom/vladsch/flexmark/util/builder/Extension;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 182
    invoke-static {}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->create()Lcom/vladsch/flexmark/util/builder/Extension;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 183
    invoke-static {}, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->create()Lcom/vladsch/flexmark/util/builder/Extension;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 185
    invoke-static {}, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->create()Lcom/vladsch/flexmark/util/builder/Extension;

    move-result-object v2

    aput-object v2, v0, v1

    .line 167
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/Md;->EXTENSIONS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 34
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/flyersoft/books/Md;->inited:Z

    const-wide/16 v1, -0x1

    .line 37
    iput-wide v1, p0, Lcom/flyersoft/books/Md;->totalSize:J

    const/4 v1, 0x1

    .line 38
    iput-boolean v1, p0, Lcom/flyersoft/books/Md;->isHtml:Z

    .line 40
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    .line 45
    :cond_0
    :try_start_0
    iput-boolean v0, p0, Lcom/flyersoft/books/Md;->showChaptersAtBegin:Z

    .line 46
    invoke-direct {p0}, Lcom/flyersoft/books/Md;->getSourceHtml()V

    .line 47
    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getChapters()Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    iput-boolean v1, p0, Lcom/flyersoft/books/Md;->inited:Z

    return-void

    :catchall_0
    move-exception v2

    .line 49
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "**ERROR BOOK***"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 50
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Md;->errMsg:Ljava/lang/String;

    .line 51
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 58
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    const/4 p1, 0x1

    .line 60
    iput-boolean p1, p0, Lcom/flyersoft/books/Md;->inited:Z

    return-void
.end method

.method private formatDocument(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 194
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v0

    const-string v1, "<div style=\"font-style: italic; border-left: 6px solid #bbbbbb; color:gray; margin-top: 1em; margin-bottom: 1em; padding-top:1em; padding-bottom:0em; padding-left: 2em; padding-right: 2em;\">"

    if-nez v0, :cond_0

    .line 195
    const-string v0, "color:gray"

    const-string v2, "color:#666666"

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 196
    :cond_0
    const-string v0, "<blockquote>"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "</blockquote>"

    const-string v1, "</div>"

    .line 197
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "<pre>"

    const-string v1, "<pre style=\"border: 1px solid #888888; padding: 1em\">"

    .line 198
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getHeaderChapters(Ljava/lang/String;)V
    .locals 12

    .line 117
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const/4 v8, -0x1

    const/4 v9, 0x0

    const/4 v0, 0x0

    const/4 v2, -0x1

    .line 120
    :goto_0
    const-string v3, "<h1"

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v10

    .line 121
    const-string v0, "</h1"

    const-string v3, ">"

    const/4 v11, 0x1

    if-eq v10, v8, :cond_2

    if-ne v2, v8, :cond_0

    .line 123
    invoke-virtual {p1, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 124
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 126
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getBookName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    int-to-long v5, v5

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 128
    :cond_0
    invoke-virtual {p1, v2, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 129
    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/2addr v2, v11

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v4, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 130
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v3, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    int-to-long v5, v5

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_1
    add-int/lit8 v0, v10, 0x1

    move v2, v10

    goto :goto_0

    :cond_2
    if-eq v2, v8, :cond_3

    .line 138
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 139
    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/2addr v2, v11

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v4, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 140
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v3, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    int-to-long v5, v5

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    :cond_3
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v11, :cond_4

    .line 143
    iput-object v7, p0, Lcom/flyersoft/books/Md;->chapters:Ljava/util/ArrayList;

    :cond_4
    return-void
.end method

.method private getSourceHtml()V
    .locals 4

    .line 148
    iget-object v0, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getFileSavedEncode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->fileEncoding:Ljava/lang/String;

    .line 149
    iget-object v0, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    sget-object v1, Lcom/flyersoft/tools/A;->fileEncoding:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 151
    new-instance v1, Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-direct {v1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>()V

    .line 152
    invoke-static {v1}, Lcom/vladsch/flexmark/parser/Parser;->builder(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    move-result-object v2

    sget-object v3, Lcom/flyersoft/books/Md;->EXTENSIONS:Ljava/util/List;

    .line 153
    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/parser/Parser$Builder;->extensions(Ljava/lang/Iterable;)Lcom/vladsch/flexmark/util/builder/BuilderBase;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/Parser$Builder;

    .line 154
    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/Parser$Builder;->build()Lcom/vladsch/flexmark/parser/Parser;

    move-result-object v2

    .line 155
    invoke-static {v1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->builder(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    move-result-object v1

    .line 156
    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->extensions(Ljava/lang/Iterable;)Lcom/vladsch/flexmark/util/builder/BuilderBase;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    const/4 v3, 0x1

    .line 157
    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->escapeHtml(Z)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    move-result-object v1

    .line 158
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->build()Lcom/vladsch/flexmark/html/HtmlRenderer;

    move-result-object v1

    .line 160
    invoke-virtual {v2, v0}, Lcom/vladsch/flexmark/parser/Parser;->parse(Ljava/lang/String;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/html/HtmlRenderer;->render(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object v0

    .line 161
    const-string v1, "&lt;h1&gt;"

    const-string v2, "<h1>"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&lt;/h1&gt;"

    const-string v2, "</h1>"

    .line 162
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 164
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Md;->formatDocument(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Md;->sourceHtml:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 4

    .line 80
    iget-object v0, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 81
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 82
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    add-int/2addr v1, v3

    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 85
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 4

    .line 70
    iget-object v0, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 71
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 72
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    const/4 v2, 0x0

    .line 73
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 319
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 1

    if-ltz p1, :cond_1

    .line 204
    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 206
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1

    .line 205
    :cond_1
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/flyersoft/books/Md;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Md;->chapters:Ljava/util/ArrayList;

    .line 107
    iget-object v0, p0, Lcom/flyersoft/books/Md;->sourceHtml:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Md;->getHeaderChapters(Ljava/lang/String;)V

    .line 108
    iget-object v0, p0, Lcom/flyersoft/books/Md;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/flyersoft/books/Md;->chapters:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getBookName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/books/Md;->sourceHtml:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    int-to-long v6, v2

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object v2, p0

    const/4 v0, 0x1

    .line 111
    iput-boolean v0, v2, Lcom/flyersoft/books/Md;->showChaptersAtBegin:Z

    goto :goto_0

    :cond_1
    move-object v2, p0

    .line 113
    :goto_0
    iget-object v0, v2, Lcom/flyersoft/books/Md;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCoverFile()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 285
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 286
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p2, p1, p1}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getFontFile(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getImageFileList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 295
    iget-object v0, p0, Lcom/flyersoft/books/Md;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 296
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Md;->imageFiles:Ljava/util/ArrayList;

    .line 298
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Md;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/flyersoft/books/Md;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 227
    new-instance v0, Lcom/flyersoft/books/Md$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Md$1;-><init>(Lcom/flyersoft/books/Md;)V

    iput-object v0, p0, Lcom/flyersoft/books/Md;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 280
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Md;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 5

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 211
    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    int-to-long v1, v1

    .line 215
    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-wide v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v1, v3

    long-to-int v1, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_1
    return v0
.end method

.method public getSingleFileText(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    .line 313
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Md;->getChapterText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalSize()J
    .locals 6

    .line 90
    iget-wide v0, p0, Lcom/flyersoft/books/Md;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 91
    iput-wide v2, p0, Lcom/flyersoft/books/Md;->totalSize:J

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/books/Md;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 93
    iget-wide v2, p0, Lcom/flyersoft/books/Md;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Md;->totalSize:J

    goto :goto_0

    .line 95
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Md;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 221
    iget-boolean v0, p0, Lcom/flyersoft/books/Md;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 65
    iget-boolean v0, p0, Lcom/flyersoft/books/Md;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 303
    iget-boolean v0, p0, Lcom/flyersoft/books/Md;->showChaptersAtBegin:Z

    return v0
.end method
