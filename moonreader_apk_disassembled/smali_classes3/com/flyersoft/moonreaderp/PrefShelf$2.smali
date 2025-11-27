.class Lcom/flyersoft/moonreaderp/PrefShelf$2;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 146
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    if-eqz p2, :cond_0

    .line 150
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    .line 151
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->eink_mode:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->about_eink_mode:I

    .line 152
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf$2$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$2$3;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$2;)V

    const v1, 0x104000a

    .line 153
    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf$2$2;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf$2$2;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$2;Landroid/widget/CompoundButton;)V

    const/high16 v1, 0x1040000

    .line 159
    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf$2$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf$2$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$2;Landroid/widget/CompoundButton;)V

    .line 165
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 170
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 172
    sput-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    sput-boolean p1, Lcom/radaee/pdf/Global;->eink:Z

    return-void
.end method
