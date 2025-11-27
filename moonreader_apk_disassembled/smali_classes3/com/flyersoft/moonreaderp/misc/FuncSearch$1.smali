.class Lcom/flyersoft/moonreaderp/misc/FuncSearch$1;
.super Ljava/lang/Object;
.source "FuncSearch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/misc/FuncSearch;->openSearchResult(Lcom/flyersoft/moonreaderp/PrefOptions;Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$root:Landroid/view/View;

.field final synthetic val$target:Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;


# direct methods
.method constructor <init>(Landroid/view/View;Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 284
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$1;->val$root:Landroid/view/View;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$1;->val$target:Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 287
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$1;->val$root:Landroid/view/View;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$1;->val$target:Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->scrollToTitle(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
