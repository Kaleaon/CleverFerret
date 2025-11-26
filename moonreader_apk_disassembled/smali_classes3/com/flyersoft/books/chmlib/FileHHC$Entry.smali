.class public Lcom/flyersoft/books/chmlib/FileHHC$Entry;
.super Ljava/lang/Object;
.source "FileHHC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/FileHHC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Entry"
.end annotation


# instance fields
.field public children:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/chmlib/FileHHC$Entry;",
            ">;"
        }
    .end annotation
.end field

.field public id:I

.field public imageNumber:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public parent:Lcom/flyersoft/books/chmlib/FileHHC$Entry;

.field final synthetic this$0:Lcom/flyersoft/books/chmlib/FileHHC;

.field public type:Ljava/lang/String;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/FileHHC;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 51
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->this$0:Lcom/flyersoft/books/chmlib/FileHHC;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/FileHHC;Lcom/flyersoft/books/chmlib/XMLNode;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->this$0:Lcom/flyersoft/books/chmlib/FileHHC;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iget-object v0, p2, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 57
    :cond_0
    iget-object p2, p2, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/chmlib/XMLNode;

    .line 58
    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->object:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    iget-object v2, v0, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-ne v1, v2, :cond_7

    .line 60
    const-string v1, "type"

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/XMLNode;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->type:Ljava/lang/String;

    .line 62
    iget-object v0, v0, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/XMLNode;

    .line 63
    sget-object v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->param:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    iget-object v3, v1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-eq v2, v3, :cond_3

    goto :goto_1

    .line 66
    :cond_3
    const-string v2, "name"

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/XMLNode;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 67
    const-string v3, "value"

    invoke-virtual {v1, v3}, Lcom/flyersoft/books/chmlib/XMLNode;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 68
    const-string v3, "Name"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 69
    iput-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->name:Ljava/lang/String;

    goto :goto_1

    .line 70
    :cond_4
    const-string v3, "Local"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 71
    iput-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->url:Ljava/lang/String;

    goto :goto_1

    .line 72
    :cond_5
    const-string v3, "ImageNumber"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 73
    iput-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->imageNumber:Ljava/lang/String;

    goto :goto_1

    .line 75
    :cond_6
    iget-object v0, p1, Lcom/flyersoft/books/chmlib/FileHHC;->fileList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    .line 76
    iget-object v0, p1, Lcom/flyersoft/books/chmlib/FileHHC;->fileList:Ljava/util/List;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 77
    :cond_7
    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->ul:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    iget-object v2, v0, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-ne v1, v2, :cond_8

    .line 78
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->addChild(Lcom/flyersoft/books/chmlib/XMLNode;)V

    .line 80
    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 81
    invoke-virtual {v0}, Ljava/util/ArrayList;->trimToSize()V

    goto/16 :goto_0

    :cond_9
    :goto_3
    return-void
.end method


# virtual methods
.method public addChild(Lcom/flyersoft/books/chmlib/FileHHC$Entry;)V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    iput-object p0, p1, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->parent:Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    return-void
.end method

.method public addChild(Lcom/flyersoft/books/chmlib/XMLNode;)V
    .locals 4

    .line 88
    iget-object v0, p1, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    goto :goto_1

    .line 90
    :cond_0
    iget-object p1, p1, Lcom/flyersoft/books/chmlib/XMLNode;->children:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/XMLNode;

    .line 91
    sget-object v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->li:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    iget-object v3, v1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-ne v2, v3, :cond_2

    .line 92
    new-instance v0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->this$0:Lcom/flyersoft/books/chmlib/FileHHC;

    invoke-direct {v0, v2, v1}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;-><init>(Lcom/flyersoft/books/chmlib/FileHHC;Lcom/flyersoft/books/chmlib/XMLNode;)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->addChild(Lcom/flyersoft/books/chmlib/FileHHC$Entry;)V

    goto :goto_0

    .line 93
    :cond_2
    sget-object v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->ul:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    iget-object v3, v1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-ne v2, v3, :cond_1

    if-eqz v0, :cond_1

    .line 95
    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->addChild(Lcom/flyersoft/books/chmlib/XMLNode;)V

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method public toHTMLTree(Ljava/io/Writer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-static {}, Lcom/flyersoft/books/chmlib/FileHHC;->-$$Nest$sfgetcloseFolderIcon()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/flyersoft/books/chmlib/FileHHC;->-$$Nest$sfgetfileIcon()Ljava/lang/String;

    move-result-object v0

    .line 127
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "<a name="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "><div id=cbt_n_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ><img id=cbt_ic_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " height=\'32\' width=\'32\' style=\'vertical-align:middle\' src="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " onclick=Tree.toggleNode("

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")>"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 129
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->url:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<a href=\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</a>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 135
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 136
    :goto_1
    const-string v0, "</div>"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 139
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "<div id=cbt_c_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " style=\'position:relative;left:20px;display:none;\'>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 142
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 143
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->toHtmlTreeChildren(Ljava/io/Writer;)V

    .line 144
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public toHtmlTreeChildren(Ljava/io/Writer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    .line 151
    invoke-virtual {v1, p1}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->toHTMLTree(Ljava/io/Writer;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public toMap()Ljava/util/LinkedHashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 101
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 103
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 104
    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC$N;->name:Lcom/flyersoft/books/chmlib/FileHHC$N;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/FileHHC$N;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->url:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 106
    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC$N;->url:Lcom/flyersoft/books/chmlib/FileHHC$N;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/FileHHC$N;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->imageNumber:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 108
    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC$N;->id:Lcom/flyersoft/books/chmlib/FileHHC$N;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/FileHHC$N;->name()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->id:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_4

    .line 112
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 113
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->children:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/chmlib/FileHHC$Entry;

    .line 114
    invoke-virtual {v3}, Lcom/flyersoft/books/chmlib/FileHHC$Entry;->toMap()Ljava/util/LinkedHashMap;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 115
    :cond_3
    sget-object v2, Lcom/flyersoft/books/chmlib/FileHHC$N;->children:Lcom/flyersoft/books/chmlib/FileHHC$N;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/FileHHC$N;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-object v0
.end method
