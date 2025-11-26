.class Lcom/flyersoft/components/cloud/Sync$29;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->addCloudFilesToShelf(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1408
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$29;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$29;->val$edit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Sync$29;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1410
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$29;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$29;->val$edit:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$29;->val$cb:Landroid/widget/CheckBox;

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefEditBook;->selectFavoriteName(Landroid/content/Context;Landroid/widget/EditText;Landroid/widget/CheckBox;)V

    return-void
.end method
