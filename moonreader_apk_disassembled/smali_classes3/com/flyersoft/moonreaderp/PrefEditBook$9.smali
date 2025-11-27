.class Lcom/flyersoft/moonreaderp/PrefEditBook$9;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->showSetDefaultCoverTip()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

.field final synthetic val$checkBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBook;Landroid/widget/CheckBox;)V
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

    .line 483
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$9;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$9;->val$checkBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 485
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$9;->val$checkBox:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0xa

    .line 486
    sput p1, Lcom/flyersoft/tools/A;->defaultCoverTip:I

    :cond_0
    return-void
.end method
