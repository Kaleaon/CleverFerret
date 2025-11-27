.class Lcom/flyersoft/moonreaderp/PrefTheme$4;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$nightTime:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;Landroid/widget/EditText;)V
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

    .line 528
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$4;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$4;->val$nightTime:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 530
    new-instance v0, Landroid/app/TimePickerDialog;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$4;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefTheme$4$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$4$1;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme$4;)V

    sget p1, Lcom/flyersoft/tools/A;->autoThemeNightTime:I

    div-int/lit8 v3, p1, 0x64

    sget p1, Lcom/flyersoft/tools/A;->autoThemeNightTime:I

    rem-int/lit8 v4, p1, 0x64

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 535
    invoke-virtual {v0}, Landroid/app/TimePickerDialog;->show()V

    return-void
.end method
