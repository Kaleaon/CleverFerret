.class Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->save(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

.field final synthetic val$deleted:Ljava/util/ArrayList;

.field final synthetic val$pre:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$107$1;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9562
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->val$deleted:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->val$pre:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 9564
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    const/4 p1, 0x0

    const/4 p2, 0x0

    .line 9565
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, -0x1

    if-ge p2, v0, :cond_3

    .line 9566
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$books:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 9568
    iget-object v2, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 9569
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->val$deleted:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 9570
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-eq v6, v1, :cond_0

    .line 9572
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    if-eqz v4, :cond_2

    .line 9575
    invoke-static {v2}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    .line 9576
    invoke-static {v0, p1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 9579
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9581
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->val$deleted:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_4
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 9582
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->val$pre:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-eq v2, v1, :cond_4

    .line 9583
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->val$pre:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 9584
    :cond_5
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$sb:Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    invoke-virtual {p2, p1, v0}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 9585
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$sb:Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;->val$pre:Ljava/util/ArrayList;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
