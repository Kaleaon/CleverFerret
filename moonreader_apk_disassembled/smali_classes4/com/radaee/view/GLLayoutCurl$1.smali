.class Lcom/radaee/view/GLLayoutCurl$1;
.super Ljava/util/TimerTask;
.source "GLLayoutCurl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/view/GLLayoutCurl;->gl_move_end()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/GLLayoutCurl;

.field final synthetic val$tstepx:I

.field final synthetic val$tstepy:I


# direct methods
.method constructor <init>(Lcom/radaee/view/GLLayoutCurl;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iput p2, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepx:I

    iput p3, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepy:I

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 100
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v1, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepx:I

    invoke-static {v0, v1}, Lcom/radaee/view/GLLayoutCurl;->access$012(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 101
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v1, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepy:I

    invoke-static {v0, v1}, Lcom/radaee/view/GLLayoutCurl;->access$112(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 102
    iget v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepx:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$000(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v0

    if-gtz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0, v2}, Lcom/radaee/view/GLLayoutCurl;->access$002(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 105
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$200(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3}, Lcom/radaee/view/GLLayoutCurl;->access$300(Lcom/radaee/view/GLLayoutCurl;I)V

    .line 106
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0, v2}, Lcom/radaee/view/GLLayoutCurl;->access$402(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 107
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$500(Lcom/radaee/view/GLLayoutCurl;)Ljava/util/Timer;

    move-result-object v0

    .line 108
    iget-object v2, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v2, v1}, Lcom/radaee/view/GLLayoutCurl;->access$502(Lcom/radaee/view/GLLayoutCurl;Ljava/util/Timer;)Ljava/util/Timer;

    .line 109
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    goto/16 :goto_0

    .line 111
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepx:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$000(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v0

    iget-object v3, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v3, v3, Lcom/radaee/view/GLLayoutCurl;->m_vw:I

    if-lt v0, v3, :cond_1

    .line 113
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v3, v0, Lcom/radaee/view/GLLayoutCurl;->m_vw:I

    invoke-static {v0, v3}, Lcom/radaee/view/GLLayoutCurl;->access$002(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 114
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0, v2}, Lcom/radaee/view/GLLayoutCurl;->access$402(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 115
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$500(Lcom/radaee/view/GLLayoutCurl;)Ljava/util/Timer;

    move-result-object v0

    .line 116
    iget-object v2, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v2, v1}, Lcom/radaee/view/GLLayoutCurl;->access$502(Lcom/radaee/view/GLLayoutCurl;Ljava/util/Timer;)Ljava/util/Timer;

    .line 117
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    goto/16 :goto_0

    .line 119
    :cond_1
    iget v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepy:I

    if-gez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$100(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v0

    if-gtz v0, :cond_3

    .line 121
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0, v2}, Lcom/radaee/view/GLLayoutCurl;->access$102(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 122
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$000(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v0

    iget-object v3, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v3, v3, Lcom/radaee/view/GLLayoutCurl;->m_vw:I

    shr-int/lit8 v3, v3, 0x1

    if-ge v0, v3, :cond_2

    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$200(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3}, Lcom/radaee/view/GLLayoutCurl;->access$300(Lcom/radaee/view/GLLayoutCurl;I)V

    .line 123
    :cond_2
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0, v2}, Lcom/radaee/view/GLLayoutCurl;->access$402(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 124
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$500(Lcom/radaee/view/GLLayoutCurl;)Ljava/util/Timer;

    move-result-object v0

    .line 125
    iget-object v2, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v2, v1}, Lcom/radaee/view/GLLayoutCurl;->access$502(Lcom/radaee/view/GLLayoutCurl;Ljava/util/Timer;)Ljava/util/Timer;

    .line 126
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    goto :goto_0

    .line 128
    :cond_3
    iget v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->val$tstepy:I

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$100(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v0

    iget-object v3, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v3, v3, Lcom/radaee/view/GLLayoutCurl;->m_vh:I

    if-lt v0, v3, :cond_5

    .line 130
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v3, v0, Lcom/radaee/view/GLLayoutCurl;->m_vh:I

    invoke-static {v0, v3}, Lcom/radaee/view/GLLayoutCurl;->access$102(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 131
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$000(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v0

    iget-object v3, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget v3, v3, Lcom/radaee/view/GLLayoutCurl;->m_vw:I

    shr-int/lit8 v3, v3, 0x1

    if-ge v0, v3, :cond_4

    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$200(Lcom/radaee/view/GLLayoutCurl;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3}, Lcom/radaee/view/GLLayoutCurl;->access$300(Lcom/radaee/view/GLLayoutCurl;I)V

    .line 132
    :cond_4
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0, v2}, Lcom/radaee/view/GLLayoutCurl;->access$402(Lcom/radaee/view/GLLayoutCurl;I)I

    .line 133
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v0}, Lcom/radaee/view/GLLayoutCurl;->access$500(Lcom/radaee/view/GLLayoutCurl;)Ljava/util/Timer;

    move-result-object v0

    .line 134
    iget-object v2, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    invoke-static {v2, v1}, Lcom/radaee/view/GLLayoutCurl;->access$502(Lcom/radaee/view/GLLayoutCurl;Ljava/util/Timer;)Ljava/util/Timer;

    .line 135
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 137
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget-object v0, v0, Lcom/radaee/view/GLLayoutCurl;->m_listener:Lcom/radaee/view/GLLayout$GLListener;

    if-eqz v0, :cond_6

    .line 138
    iget-object v0, p0, Lcom/radaee/view/GLLayoutCurl$1;->this$0:Lcom/radaee/view/GLLayoutCurl;

    iget-object v0, v0, Lcom/radaee/view/GLLayoutCurl;->m_listener:Lcom/radaee/view/GLLayout$GLListener;

    invoke-interface {v0}, Lcom/radaee/view/GLLayout$GLListener;->OnRedraw()V

    :cond_6
    return-void
.end method
