.class Lcom/flyersoft/moonreaderp/PrefEditBookmark$1;
.super Ljava/lang/Object;
.source "PrefEditBookmark.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBookmark;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;Ljava/lang/Integer;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 52
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$1;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$1;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 55
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$1;->val$v:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 56
    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    :cond_0
    return-void
.end method
