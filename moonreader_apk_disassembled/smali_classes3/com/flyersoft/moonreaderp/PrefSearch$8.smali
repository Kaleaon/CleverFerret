.class Lcom/flyersoft/moonreaderp/PrefSearch$8;
.super Ljava/lang/Object;
.source "PrefSearch.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 618
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$8;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 621
    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchHistory()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    const/4 p1, 0x0

    .line 622
    invoke-static {p1}, Lcom/flyersoft/tools/A;->saveSearchKey(Ljava/lang/String;)V

    return-void
.end method
