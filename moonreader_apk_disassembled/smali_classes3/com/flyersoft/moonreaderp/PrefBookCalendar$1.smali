.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$1;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 93
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$1;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 96
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$1;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->-$$Nest$mgoMonth(Lcom/flyersoft/moonreaderp/PrefBookCalendar;I)V

    return-void
.end method
