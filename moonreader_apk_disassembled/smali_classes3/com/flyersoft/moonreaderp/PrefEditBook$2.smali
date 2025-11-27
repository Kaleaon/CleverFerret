.class Lcom/flyersoft/moonreaderp/PrefEditBook$2;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 225
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 228
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->favEt:Landroid/widget/EditText;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setEnabled(Z)V

    return-void
.end method
