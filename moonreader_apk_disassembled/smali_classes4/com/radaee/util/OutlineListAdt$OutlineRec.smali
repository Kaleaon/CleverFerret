.class Lcom/radaee/util/OutlineListAdt$OutlineRec;
.super Ljava/lang/Object;
.source "OutlineListAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/OutlineListAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OutlineRec"
.end annotation


# instance fields
.field private m_parent:Lcom/radaee/util/OutlineListAdt$OutlineRec;

.field private m_parent_outline:Lcom/radaee/pdf/Document$Outline;

.field final synthetic this$0:Lcom/radaee/util/OutlineListAdt;


# direct methods
.method private constructor <init>(Lcom/radaee/util/OutlineListAdt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 23
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$OutlineRec;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/util/OutlineListAdt;Lcom/radaee/util/OutlineListAdt$1;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/radaee/util/OutlineListAdt$OutlineRec;-><init>(Lcom/radaee/util/OutlineListAdt;)V

    return-void
.end method

.method static synthetic access$100(Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/pdf/Document$Outline;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/radaee/util/OutlineListAdt$OutlineRec;->m_parent_outline:Lcom/radaee/pdf/Document$Outline;

    return-object p0
.end method

.method static synthetic access$102(Lcom/radaee/util/OutlineListAdt$OutlineRec;Lcom/radaee/pdf/Document$Outline;)Lcom/radaee/pdf/Document$Outline;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$OutlineRec;->m_parent_outline:Lcom/radaee/pdf/Document$Outline;

    return-object p1
.end method

.method static synthetic access$200(Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/util/OutlineListAdt$OutlineRec;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/radaee/util/OutlineListAdt$OutlineRec;->m_parent:Lcom/radaee/util/OutlineListAdt$OutlineRec;

    return-object p0
.end method

.method static synthetic access$202(Lcom/radaee/util/OutlineListAdt$OutlineRec;Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/util/OutlineListAdt$OutlineRec;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$OutlineRec;->m_parent:Lcom/radaee/util/OutlineListAdt$OutlineRec;

    return-object p1
.end method
