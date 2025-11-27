.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$3;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 430
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 433
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->removeBookFromGroup(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    return-void
.end method
