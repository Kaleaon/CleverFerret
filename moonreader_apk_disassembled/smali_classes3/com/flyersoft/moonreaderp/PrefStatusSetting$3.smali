.class Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;
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

    .line 149
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 151
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->edgeRG:Landroid/widget/RadioGroup;

    invoke-virtual {p1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p1

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->topRadio:I

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    sput-boolean p1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    .line 152
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mafterChapterEdgeChanged(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    .line 153
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$msetChapterMarginVisible(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    .line 154
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    return-void
.end method
