.class Lcom/flyersoft/moonreaderp/PrefMisc$34;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

.field final synthetic val$backColor:Landroid/view/View;

.field final synthetic val$backColorNight:Landroid/view/View;

.field final synthetic val$fontColor:Landroid/view/View;

.field final synthetic val$fontColorNight:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1046
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$fontColor:Landroid/view/View;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$backColor:Landroid/view/View;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$fontColorNight:Landroid/view/View;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$backColorNight:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    const p1, -0xeeeeef

    .line 1049
    sput p1, Lcom/flyersoft/tools/A;->noteTextColor:I

    const v0, -0x91574

    .line 1050
    sput v0, Lcom/flyersoft/tools/A;->noteBackColor:I

    .line 1051
    sput p1, Lcom/flyersoft/tools/A;->noteTextColorNight:I

    .line 1052
    sput v0, Lcom/flyersoft/tools/A;->noteBackColorNight:I

    .line 1053
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$fontColor:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->noteTextColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1054
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$backColor:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->noteBackColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1055
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$fontColorNight:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->noteTextColorNight:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1056
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$34;->val$backColorNight:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->noteBackColorNight:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method
