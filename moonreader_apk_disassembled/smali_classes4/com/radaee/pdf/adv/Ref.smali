.class public Lcom/radaee/pdf/adv/Ref;
.super Ljava/lang/Object;
.source "Ref.java"


# instance fields
.field protected hand:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-wide p1, p0, Lcom/radaee/pdf/adv/Ref;->hand:J

    return-void
.end method


# virtual methods
.method public get_hand()J
    .locals 2

    .line 13
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Ref;->hand:J

    return-wide v0
.end method
