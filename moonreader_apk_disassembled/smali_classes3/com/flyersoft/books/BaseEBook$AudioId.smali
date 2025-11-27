.class public Lcom/flyersoft/books/BaseEBook$AudioId;
.super Ljava/lang/Object;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/BaseEBook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioId"
.end annotation


# instance fields
.field public id:Ljava/lang/String;

.field public position:I

.field final synthetic this$0:Lcom/flyersoft/books/BaseEBook;


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/BaseEBook;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 81
    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook$AudioId;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
