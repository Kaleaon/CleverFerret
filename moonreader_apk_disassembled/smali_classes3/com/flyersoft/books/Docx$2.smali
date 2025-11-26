.class Lcom/flyersoft/books/Docx$2;
.super Ljava/lang/Thread;
.source "Docx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Docx;->checkDownloadBookCover(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Docx;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Docx;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 470
    iput-object p1, p0, Lcom/flyersoft/books/Docx$2;->this$0:Lcom/flyersoft/books/Docx;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 473
    iget-object v0, p0, Lcom/flyersoft/books/Docx$2;->this$0:Lcom/flyersoft/books/Docx;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/books/Docx;->-$$Nest$mcheckDownloadBooCover2(Lcom/flyersoft/books/Docx;Z)V

    return-void
.end method
