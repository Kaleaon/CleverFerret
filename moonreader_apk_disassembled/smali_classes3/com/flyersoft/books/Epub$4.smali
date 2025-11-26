.class Lcom/flyersoft/books/Epub$4;
.super Ljava/lang/Thread;
.source "Epub.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Epub;->checkDownloadBookCover(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Epub;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Epub;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2257
    iput-object p1, p0, Lcom/flyersoft/books/Epub$4;->this$0:Lcom/flyersoft/books/Epub;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 2260
    iget-object v0, p0, Lcom/flyersoft/books/Epub$4;->this$0:Lcom/flyersoft/books/Epub;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/books/Epub;->-$$Nest$mcheckDownloadBooCover2(Lcom/flyersoft/books/Epub;Z)V

    return-void
.end method
