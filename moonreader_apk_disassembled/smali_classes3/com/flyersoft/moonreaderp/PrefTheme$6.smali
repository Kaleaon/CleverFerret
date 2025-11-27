.class Lcom/flyersoft/moonreaderp/PrefTheme$6;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

.field final synthetic val$dayBrightness:Landroid/widget/EditText;

.field final synthetic val$dayCb:Landroid/widget/CheckBox;

.field final synthetic val$dayCb2:Landroid/widget/CheckBox;

.field final synthetic val$nightBrightness:Landroid/widget/EditText;

.field final synthetic val$nightCb:Landroid/widget/CheckBox;

.field final synthetic val$nightCb2:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
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

    .line 553
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$dayCb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$dayCb2:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$nightCb:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$nightCb2:Landroid/widget/CheckBox;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$dayBrightness:Landroid/widget/EditText;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$nightBrightness:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 555
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$dayCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->autoThemeDay:Z

    .line 556
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$dayCb2:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->autoDaySetBright:Z

    .line 557
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$nightCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->autoThemeNight:Z

    .line 558
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$nightCb2:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->autoNightSetBright:Z

    .line 560
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$dayBrightness:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->autoThemeDayBrightness:I

    .line 561
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$6;->val$nightBrightness:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->autoThemeNightBrightness:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
