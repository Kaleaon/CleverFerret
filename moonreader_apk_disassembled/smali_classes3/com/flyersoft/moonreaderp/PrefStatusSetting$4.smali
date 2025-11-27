.class Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;
.super Ljava/lang/Object;
.source "PrefStatusSetting.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 158
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 1

    .line 160
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->alignRG:Landroid/widget/RadioGroup;

    invoke-virtual {p1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p1

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->leftRadio:I

    if-ne p1, p2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 161
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->alignRG:Landroid/widget/RadioGroup;

    invoke-virtual {p1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p1

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->centerRadio:I

    if-ne p1, p2, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x2

    .line 162
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-nez p2, :cond_2

    sget-boolean p2, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-ne p2, v0, :cond_2

    .line 163
    sput p1, Lcom/flyersoft/tools/A;->chapterAlignStatus:I

    goto :goto_1

    .line 165
    :cond_2
    sput p1, Lcom/flyersoft/tools/A;->chapterAlign:I

    .line 166
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$msetChapterMarginVisible(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    .line 167
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    return-void
.end method
