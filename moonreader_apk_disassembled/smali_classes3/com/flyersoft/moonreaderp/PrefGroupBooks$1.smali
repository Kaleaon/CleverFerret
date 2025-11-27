.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 149
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 4

    const/4 v0, 0x1

    .line 152
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "*****************Hold Outside**********"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 153
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    if-le v2, v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->onOutsite:Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;

    invoke-virtual {v1, p1, v0, v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismiss(Ljava/lang/String;ILcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;)V

    return-void
.end method
