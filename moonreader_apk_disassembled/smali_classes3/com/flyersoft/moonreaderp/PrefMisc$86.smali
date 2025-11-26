.class Lcom/flyersoft/moonreaderp/PrefMisc$86;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->checkIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$lay:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2185
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$86;->val$lay:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 2

    .line 2187
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$86;->val$lay:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->setListLayVisible(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method
