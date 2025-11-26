.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$1;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 546
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSaveBookInfo()V
    .locals 0

    .line 548
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->updateGroupShelf()Z

    return-void
.end method
