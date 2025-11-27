.class Lcom/flyersoft/books/Epub$Reference;
.super Ljava/lang/Object;
.source "Epub.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/Epub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Reference"
.end annotation


# instance fields
.field href:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/books/Epub;

.field title:Ljava/lang/String;


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

    .line 594
    iput-object p1, p0, Lcom/flyersoft/books/Epub$Reference;->this$0:Lcom/flyersoft/books/Epub;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
