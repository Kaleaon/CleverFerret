.class public Lcom/flyersoft/books/chmlib/FileHHC;
.super Ljava/lang/Object;
.source "FileHHC.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/chmlib/FileHHC$Entry;,
        Lcom/flyersoft/books/chmlib/FileHHC$N;
    }
.end annotation


# static fields
.field private static MF_HTML_NODE:Ljava/text/MessageFormat;

.field private static MF_HTML_NODE_A:Ljava/text/MessageFormat;

.field private static MF_HTM_CHILDREN:Ljava/text/MessageFormat;

.field private static closeFolderIcon:Ljava/lang/String;

.field private static fileIcon:Ljava/lang/String;

.field public static logger:Lcom/flyersoft/books/chmlib/Logger;

.field private static openFolderIcon:Ljava/lang/String;

.field private static treeHome:Ljava/lang/String;


# instance fields
.field public fileList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public root:Lcom/flyersoft/books/chmlib/FileHHC$Entry;


# direct methods
.method static bridge synthetic -$$Nest$sfgetcloseFolderIcon()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->closeFolderIcon:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetfileIcon()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->fileIcon:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 15
    const-string v0, "FileHHC"

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/Logger;->getLogger(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    .line 21
    new-instance v0, Ljava/text/MessageFormat;

    const-string v1, "<a name={0}><div id=cbt_n_{0} ><img id=cbt_ic_{0} height=\'32\' width=\'32\' style=\'vertical-align:middle\' src={3} onclick=Tree.toggleNode({0})>"

    invoke-direct {v0, v1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->MF_HTML_NODE:Ljava/text/MessageFormat;

    .line 24
    new-instance v0, Ljava/text/MessageFormat;

    const-string v1, "<a href=\"{2}\">{1}</a>"

    invoke-direct {v0, v1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->MF_HTML_NODE_A:Ljava/text/MessageFormat;

    .line 26
    new-instance v0, Ljava/text/MessageFormat;

    const-string v1, "<div id=cbt_c_{0} style=\'position:relative;left:20px;display:none;\'>"

    invoke-direct {v0, v1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->MF_HTM_CHILDREN:Ljava/text/MessageFormat;

    .line 30
    const-string v0, "/android_asset/tree"

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->treeHome:Ljava/lang/String;

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC;->treeHome:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/images/expander_ic_minimized.9.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->closeFolderIcon:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC;->treeHome:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/images/expander_ic_maximized.9.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->openFolderIcon:Ljava/lang/String;

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC;->treeHome:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/images/file.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->fileIcon:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/MyBufferedReader;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC;->fileList:Ljava/util/List;

    const/4 v0, 0x0

    .line 157
    sput v0, Lcom/flyersoft/books/chmlib/XMLNode;->count:I

    .line 158
    invoke-static {p1}, Lcom/flyersoft/books/chmlib/HTMLParsor;->parse(Lcom/flyersoft/books/chmlib/MyBufferedReader;)Lcom/flyersoft/books/chmlib/XMLNode;

    move-result-object p1

    .line 159
    sget-object v0, Lcom/flyersoft/books/chmlib/FileHHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "FileHHC: XMLNode.count="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/books/chmlib/XMLNode;->count:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/Logger;->log(Ljava/lang/String;)V

    .line 163
    sget-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->html:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/XMLNode;->findChild(Lcom/flyersoft/books/chmlib/XMLNode$Tag;)Lcom/flyersoft/books/chmlib/XMLNode;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 166
    :cond_0
    sget-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->html:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/XMLNode;->findChild(Lcom/flyersoft/books/chmlib/XMLNode$Tag;)Lcom/flyersoft/books/chmlib/XMLNode;

    move-result-object p1

    sget-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->body:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/XMLNode;->findChild(Lcom/flyersoft/books/chmlib/XMLNode$Tag;)Lcom/flyersoft/books/chmlib/XMLNode;

    move-result-object p1

    .line 168
    :goto_0
    new-instance v0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;-><init>(Lcom/flyersoft/books/chmlib/FileHHC;Lcom/flyersoft/books/chmlib/XMLNode;)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC;->root:Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 172
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/FileHHC;->fileList:Ljava/util/List;

    .line 173
    new-instance v0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;-><init>(Lcom/flyersoft/books/chmlib/FileHHC;)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC;->root:Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    .line 175
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 176
    new-instance v2, Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    invoke-direct {v2, p0}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;-><init>(Lcom/flyersoft/books/chmlib/FileHHC;)V

    .line 177
    iput-object v1, v2, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->name:Ljava/lang/String;

    .line 178
    iput-object v1, v2, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->url:Ljava/lang/String;

    add-int/lit8 v1, v0, 0x1

    .line 179
    iput v0, v2, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    .line 180
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC;->root:Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    invoke-virtual {v0, v2}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->addChild(Lcom/flyersoft/books/chmlib/FileHHC$Entry;)V

    const/16 v0, 0x64

    if-le v1, v0, :cond_0

    goto :goto_1

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public toHTMLTree(Ljava/io/Writer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC;->root:Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->toHtmlTreeChildren(Ljava/io/Writer;)V

    return-void
.end method

.method public toJSON()Ljava/lang/String;
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC;->root:Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->toMap()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/ChmUtil;->toJSON(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
