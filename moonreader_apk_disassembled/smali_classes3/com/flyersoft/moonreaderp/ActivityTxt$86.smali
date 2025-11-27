.class Lcom/flyersoft/moonreaderp/ActivityTxt$86;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showEpub3PageList()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 9865
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$86;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 9868
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$86;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    .line 9869
    sget-object p1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook;->pages:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 9870
    iget-object p2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    .line 9871
    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 9872
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "#"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 9873
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$86;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputcheckUrlFootnote(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 9874
    sput-boolean v0, Lcom/flyersoft/tools/A;->moveStart:Z

    .line 9875
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$86;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    const-wide/16 v1, 0x32

    invoke-static {v0, p2, p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenUrlLink(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method
