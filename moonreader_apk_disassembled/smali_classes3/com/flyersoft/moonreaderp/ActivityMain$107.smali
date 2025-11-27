.class Lcom/flyersoft/moonreaderp/ActivityMain$107;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->updateBookTags(Ljava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$books:Ljava/util/ArrayList;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$sb:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/StringBuilder;Landroid/widget/EditText;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9543
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$sb:Ljava/lang/StringBuilder;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$edit:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$books:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 9545
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$107;)V

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefEditBook;->selectTagName(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;)V

    return-void
.end method
